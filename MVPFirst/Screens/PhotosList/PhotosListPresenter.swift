//
//  PostsListPresenter.swift
//  MVPFirst
//
//  Created by Алексей on 08.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class PhotosListPresenter {
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
        photosDao?.getPhotosData(onComplete: { [weak self] photos in
            guard let strongSelf = self else { return }
            strongSelf.handleSuccess {
                strongSelf.photos = photos
                strongSelf.view?.items = photos.map { PhotoListItem(photo: $0) }
                strongSelf.view?.endLoading()
            }
        }, onFailure: { [weak self] error in
            guard let strongSelf = self else { return }
            strongSelf.handleError(error: error)
            strongSelf.view?.endLoading()
        })
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        view?.deselectRow(at: indexPath)
        let photoDetails = PhotoDetails(photo: photos[indexPath.row])
        view?.openDetails(details: photoDetails)
    }
    
    func getImage(url: String, onComplete: @escaping (URL, UIImage) -> Void, onFailure: @escaping (Error) -> Void) {
        let url = URL(string: url)!
        imageDownloader?.getImage(url: url, onComplete: { [weak self] url, image in
            guard let strongSelf = self else { return }
            strongSelf.handleSuccess { onComplete(url, image) }
        },onFailure: { error in
            DispatchQueue.main.async { onFailure(error) }
        })
    }
    
    private func handleSuccess(action: @escaping () -> Void) {
        DispatchQueue.main.async { action() }
    }
    
    private func handleError(error: Error) {
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
