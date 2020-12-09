//
//  PhotoDetailsView.swift
//  MVPFirst
//
//  Created by Алексей on 09.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

protocol PhotoDetailsView: AnyObject {
    var presenter: PhotoDetailsViewPresenter? { get set }
    var photoDetails: PhotoDetails? { get set }
    
    func startLoading()
    func endLoading()
    func loadImage()
}
