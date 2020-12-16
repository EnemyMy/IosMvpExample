//
//  ViewController.swift
//  MVPFirst
//
//  Created by Алексей on 08.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

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

class PhotosListViewController: UITableViewController {
    
    var presenter: PhotosListViewPresenter?
    let indicatorView = UIActivityIndicatorView(style: .large)
    var items: [PhotoListItem] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor.white
        setupIndicatorView()
        setupTableView()
        presenter?.viewLoaded()
    }
    
    private func setupIndicatorView() {
        indicatorView.hidesWhenStopped = true
        indicatorView.color = UIColor.black
        view.addSubview(indicatorView)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                indicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                indicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ]
        )
    }
    
    private func setupTableView() {
        tableView.rowHeight = 100
        tableView.registerCell(cell: PhotoTableViewCell.self)
    }
}

extension PhotosListViewController: PhotosListView {
    func startLoading() {
        indicatorView.startAnimating()
    }
    
    func endLoading() {
        indicatorView.stopAnimating()
    }
    
    func selectRow(at indexPath: IndexPath) {
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .top)
    }
    
    func deselectRow(at indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func showAlert(title: String, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    func openDetails(details: PhotoDetails) {
        let vc = PhotoDetailsAssembly.assemble(details: details)
        present(vc, animated: true)
    }
}

//MARK: UITableViewDatasource

extension PhotosListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeCell(cell: PhotoTableViewCell.self, indexPath: indexPath)
        let item = items[indexPath.row]
        cell.title.text = item.title
        cell.imageURL = item.thumbnailUrl
        presenter?.getImage(url: item.thumbnailUrl) { result in
            switch result {
            case .failure(_):
                cell.imageURL = ""
                cell.photo.image = #imageLiteral(resourceName: "noImage")
            case .success((let url, let image)):
                if url.absoluteString == cell.imageURL {
                    cell.photo.image = image
                }
            }
        }
        return cell
    }
}

//MARK: UITableViewDelegate

extension PhotosListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectItem(at: indexPath)
    }
}
