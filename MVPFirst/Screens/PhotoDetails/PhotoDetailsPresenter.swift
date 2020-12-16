//
//  PhotoDetailsPresenter.swift
//  MVPFirst
//
//  Created by Алексей on 09.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

protocol PhotoDetailsViewPresenter: AnyObject {
    var view: PhotoDetailsView? { get set }
    init(view: PhotoDetailsView)
    
    func viewLoaded()
    func getImage(url: String, completionHandler: @escaping (Result<UIImage, Error>) -> Void)
}

final class PhotoDetailsPresenter {
    weak var view: PhotoDetailsView?
    var imageDownloader: ImageDownloader?
    
    required init(view: PhotoDetailsView) {
        self.view = view
    }
}

extension PhotoDetailsPresenter: PhotoDetailsViewPresenter {
    
    func viewLoaded() {
        view?.startLoading()
        view?.loadImage()
    }
    
    func getImage(url: String, completionHandler: @escaping (Result<UIImage, Error>) -> Void) {
        let url = URL(string: url)!
        imageDownloader?.getImage(url: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                self.handleFailure {
                    completionHandler(.failure(error))
                    self.view?.endLoading()
                }
            case .success((_, let image)):
                self.handleSuccess {
                    completionHandler(.success(image))
                    self.view?.endLoading()
                }
            }
        }
    }
    
    func handleSuccess(action: @escaping () -> Void) {
        DispatchQueue.main.async { action() }
    }
    
    func handleFailure(action: @escaping () -> Void) {
        DispatchQueue.main.async { action() }
    }
}
