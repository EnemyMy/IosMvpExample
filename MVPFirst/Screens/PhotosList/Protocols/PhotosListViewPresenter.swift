//
//  PostsListViewPresenter.swift
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
