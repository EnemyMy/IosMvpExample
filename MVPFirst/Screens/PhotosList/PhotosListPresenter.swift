//
//  PostsListPresenter.swift
//  MVPFirst
//
//  Created by Алексей on 08.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

protocol PhotosListViewPresenter: AnyObject {
    var view: PhotosListView? { get set }
    init(view: PhotosListView)
    
    func viewLoaded()
    func didSelectItem(at indexPath: IndexPath)
    
    func getImage(url: String, completionHandler: @escaping (Result<(URL, UIImage), Error>) -> Void)
}

final class PhotosListPresenter {
    var photosDao: PhotosDao?
    var imageDownloader: ImageDownloader?
    weak var view: PhotosListView?
    var photos: [Photo] = []
    
    required init(view: PhotosListView) {
        self.view = view
    }
}

extension PhotosListPresenter: PhotosListViewPresenter {
    func viewLoaded() {
        view?.startLoading()
        photosDao?.getPhotosData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                self.handleError(error: error)
                self.view?.endLoading()
            case .success(let photos):
                self.handleSuccess {
                    self.photos = photos
                    self.view?.items = photos.map { PhotoListItem(photo: $0) }
                    self.view?.endLoading()
                }
            }
        }
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        view?.deselectRow(at: indexPath)
        let photoDetails = PhotoDetails(photo: photos[indexPath.row])
        view?.openDetails(details: photoDetails)
    }
    
    func getImage(url: String, completionHandler: @escaping (Result<(URL, UIImage), Error>) -> Void) {
        let url = URL(string: url)!
        imageDownloader?.getImage(url: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    completionHandler(.failure(error))
                }
            case .success((let url, let image)):
                self.handleSuccess {
                    completionHandler(.success((url, image)))
                }
            }
        }
    }
    
    func handleSuccess(action: @escaping () -> Void) {
        DispatchQueue.main.async { action() }
    }
    
    func handleError(error: Error) {
        let title = "Error"
        var message = ""
        switch error {
        case NetworkError.connectionError(let error): message = error.localizedDescription
        case NetworkError.noData: message = "Server return no data"
        case NetworkError.wrongResponseType: message = "Response type is not supported"
        case NetworkError.wrongStatusCode(let statusCode): message = "Wrong response status code: \(statusCode)"
        case CodableError.decodingError: message = "Can't parse response data"
        case ImageDownloadError.wrongImageData: message = "Wrong image data"
        default: break
        }
        DispatchQueue.main.async {
            self.view?.showAlert(title: title, message: message)
        }
    }
}
