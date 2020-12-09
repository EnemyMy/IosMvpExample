//
//  PhotoDetailsPresenter.swift
//  MVPFirst
//
//  Created by Алексей on 09.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class PhotoDetailsPresenter {
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
    
    func getImage(url: String, onComplete: @escaping (UIImage) -> Void, onFailure: @escaping (Error) -> Void) {
        let url = URL(string: url)!
        imageDownloader?.getImage(url: url, onComplete: { [weak self] url, image in
            guard let strongSelf = self else { return }
            strongSelf.handleSuccess {
                onComplete(image)
                strongSelf.view?.endLoading()
            }
        }, onFailure: { [weak self] error in
            guard let strongSelf = self else { return }
            strongSelf.handleFailure {
                onFailure(error)
                strongSelf.view?.endLoading()
            }
        })
    }
    
    func handleSuccess(action: @escaping () -> Void) {
        DispatchQueue.main.async { action() }
    }
    
    func handleFailure(action: @escaping () -> Void) {
        DispatchQueue.main.async { action() }
    }
}
