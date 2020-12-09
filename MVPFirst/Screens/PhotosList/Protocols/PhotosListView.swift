//
//  PostsListView.swift
//  MVPFirst
//
//  Created by Алексей on 08.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

protocol PhotosListView: AnyObject {
    var presenter: PhotosListViewPresenter? { get set }
    var items: [PhotoListItem] { get set }
    
    func startLoading()
    func endLoading()
    func selectRow(at indexPath: IndexPath)
    func deselectRow(at indexPath: IndexPath)
    func showAlert(title: String, message: String?)
    func openDetails(details: PhotoDetails)
}
