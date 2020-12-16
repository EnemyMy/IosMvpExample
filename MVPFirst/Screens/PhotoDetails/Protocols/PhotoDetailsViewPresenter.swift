//
//  PhotoDetailsViewPresenter.swift
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
