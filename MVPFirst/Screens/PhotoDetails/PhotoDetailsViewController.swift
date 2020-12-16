//
//  PhotoDetailsViewController.swift
//  MVPFirst
//
//  Created by Алексей on 09.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {
    
    var presenter: PhotoDetailsViewPresenter?
    var photoDetails: PhotoDetails?
    let activityIndicator = UIActivityIndicatorView(style: .large)
    let photo = UIImageView()
    let albumIdLabel = UILabel()
    let albumIdText = UILabel()
    let idLabel = UILabel()
    let idText = UILabel()
    let titleLabel = UILabel()
    let titleText = UILabel()
    let urlLabel = UILabel()
    let urlText = UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupViewsConstraints()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        setupViewsConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor.white
        setupActivityIndicator()
        setupPhoto()
        setupAlbumId()
        setupId()
        setupTitle()
        setupUrl()
        presenter?.viewLoaded()
    }
    
    private func setupViewsConstraints() {
        setupActivityIndicatorConstraints()
        setupPhotoConstraints()
        setupAlbumIdConstraints()
        setupIdConstraints()
        setupTitleConstraints()
        setupUrlConstraints()
    }
    
    private func setupActivityIndicator() {
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = UIColor.black
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupActivityIndicatorConstraints() {
        NSLayoutConstraint.deactivate(activityIndicator.constraints)
        activityIndicator.removeFromSuperview()
        view.addSubview(activityIndicator)
        NSLayoutConstraint.activate(
            [
                activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ]
        )
    }
    
    private func setupPhoto() {
        photo.contentMode = .scaleAspectFill
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupPhotoConstraints() {
        NSLayoutConstraint.deactivate(photo.constraints)
        photo.removeFromSuperview()
        view.addSubview(photo)
        if UIDevice.isLandcape {
            NSLayoutConstraint.activate(
                [
                    photo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                    photo.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
                    photo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                    photo.widthAnchor.constraint(equalTo: photo.heightAnchor)
                ]
            )
        } else {
            NSLayoutConstraint.activate(
                [
                    photo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                    photo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                    photo.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                    photo.heightAnchor.constraint(equalTo: photo.widthAnchor)
                ]
            )
        }
    }
    
    private func setupAlbumId() {
        guard let albumId = photoDetails?.albumId else {
            return
        }
        albumIdLabel.text = "Album Id:"
        albumIdText.textColor = UIColor.gray
        albumIdText.text = "\(albumId)"
        albumIdLabel.translatesAutoresizingMaskIntoConstraints = false
        albumIdText.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupAlbumIdConstraints() {
        NSLayoutConstraint.deactivate(albumIdLabel.constraints)
        NSLayoutConstraint.deactivate(albumIdText.constraints)
        
        albumIdLabel.removeFromSuperview()
        albumIdText.removeFromSuperview()

        view.addSubview(albumIdLabel)
        view.addSubview(albumIdText)
        
        if UIDevice.isLandcape {
            NSLayoutConstraint.activate(
                [
                    albumIdLabel.topAnchor.constraint(equalTo: photo.topAnchor),
                    albumIdLabel.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
                    albumIdLabel.widthAnchor.constraint(equalToConstant: 75),
                    albumIdLabel.heightAnchor.constraint(equalToConstant: 20),
                    albumIdText.topAnchor.constraint(equalTo: albumIdLabel.topAnchor),
                    albumIdText.leadingAnchor.constraint(equalTo: albumIdLabel.trailingAnchor, constant: 10),
                    albumIdText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                    albumIdText.heightAnchor.constraint(equalTo: albumIdLabel.heightAnchor)
                ]
            )
        } else {
            NSLayoutConstraint.activate(
                [
                    albumIdLabel.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 10),
                    albumIdLabel.leadingAnchor.constraint(equalTo: photo.leadingAnchor),
                    albumIdLabel.widthAnchor.constraint(equalToConstant: 75),
                    albumIdLabel.heightAnchor.constraint(equalToConstant: 20),
                    albumIdText.topAnchor.constraint(equalTo: albumIdLabel.topAnchor),
                    albumIdText.leadingAnchor.constraint(equalTo: albumIdLabel.trailingAnchor, constant: 10),
                    albumIdText.widthAnchor.constraint(equalToConstant: 30),
                    albumIdText.heightAnchor.constraint(equalTo: albumIdLabel.heightAnchor)
                ]
            )
        }
    }

    private func setupId() {
        guard let id = photoDetails?.id else {
            return
        }
        idLabel.text = "Id:"
        idText.textColor = UIColor.gray
        idText.text = "\(id)"
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        idText.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupIdConstraints() {
        NSLayoutConstraint.deactivate(idLabel.constraints)
        NSLayoutConstraint.deactivate(idText.constraints)
        
        idLabel.removeFromSuperview()
        idText.removeFromSuperview()

        view.addSubview(idLabel)
        view.addSubview(idText)
        
        if UIDevice.isLandcape {
            NSLayoutConstraint.activate(
                [
                    idLabel.topAnchor.constraint(equalTo: albumIdLabel.bottomAnchor, constant: 20),
                    idLabel.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
                    idLabel.widthAnchor.constraint(equalToConstant: 25),
                    idLabel.heightAnchor.constraint(equalToConstant: 20),
                    idText.topAnchor.constraint(equalTo: idLabel.topAnchor),
                    idText.leadingAnchor.constraint(equalTo: idLabel.trailingAnchor, constant: 10),
                    idText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                    idText.heightAnchor.constraint(equalTo: idLabel.heightAnchor)
                ]
            )
        } else {
            NSLayoutConstraint.activate(
                [
                    idLabel.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 10),
                    idLabel.trailingAnchor.constraint(equalTo: idText.leadingAnchor, constant: -10),
                    idLabel.widthAnchor.constraint(equalToConstant: 25),
                    idLabel.heightAnchor.constraint(equalToConstant: 20),
                    idText.topAnchor.constraint(equalTo: idLabel.topAnchor),
                    idText.trailingAnchor.constraint(equalTo: photo.trailingAnchor),
                    idText.widthAnchor.constraint(equalToConstant: 30),
                    idText.heightAnchor.constraint(equalTo: idLabel.heightAnchor)
                ]
            )
        }
    }

    private func setupTitle() {
        guard let title = photoDetails?.title else {
            return
        }
        titleLabel.text = "Title:"
        titleText.textColor = UIColor.gray
        titleText.text = "\(title)"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleText.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupTitleConstraints() {
        NSLayoutConstraint.deactivate(titleLabel.constraints)
        NSLayoutConstraint.deactivate(titleText.constraints)
        
        titleLabel.removeFromSuperview()
        titleText.removeFromSuperview()

        view.addSubview(titleLabel)
        view.addSubview(titleText)
        
        if UIDevice.isLandcape {
            titleText.numberOfLines = 0
            NSLayoutConstraint.activate(
                [
                    titleLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 20),
                    titleLabel.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
                    titleLabel.widthAnchor.constraint(equalToConstant: 40),
                    titleLabel.heightAnchor.constraint(equalToConstant: 60),
                    titleText.topAnchor.constraint(equalTo: titleLabel.topAnchor),
                    titleText.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
                    titleText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                    titleText.heightAnchor.constraint(equalTo: titleLabel.heightAnchor)
                ]
            )
        } else {
            titleText.numberOfLines = 1
            NSLayoutConstraint.activate(
                [
                    titleLabel.topAnchor.constraint(equalTo: albumIdLabel.bottomAnchor, constant: 10),
                    titleLabel.leadingAnchor.constraint(equalTo: photo.leadingAnchor),
                    titleLabel.widthAnchor.constraint(equalToConstant: 40),
                    titleLabel.heightAnchor.constraint(equalToConstant: 20),
                    titleText.topAnchor.constraint(equalTo: titleLabel.topAnchor),
                    titleText.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
                    titleText.trailingAnchor.constraint(equalTo: photo.trailingAnchor),
                    titleText.heightAnchor.constraint(equalTo: titleLabel.heightAnchor)
                ]
            )
        }
    }

    private func setupUrl() {
        guard let url = photoDetails?.url else {
            return
        }
        urlLabel.text = "Url:"
        urlText.textColor = UIColor.gray
        urlText.text = "\(url)"
        urlLabel.translatesAutoresizingMaskIntoConstraints = false
        urlText.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupUrlConstraints() {
        NSLayoutConstraint.deactivate(urlLabel.constraints)
        NSLayoutConstraint.deactivate(urlText.constraints)
        
        urlLabel.removeFromSuperview()
        urlText.removeFromSuperview()

        view.addSubview(urlLabel)
        view.addSubview(urlText)
        
        if UIDevice.isLandcape {
            urlText.numberOfLines = 0
            NSLayoutConstraint.activate(
                [
                    urlLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
                    urlLabel.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
                    urlLabel.widthAnchor.constraint(equalToConstant: 40),
                    urlLabel.heightAnchor.constraint(equalToConstant: 60),
                    urlText.topAnchor.constraint(equalTo: urlLabel.topAnchor),
                    urlText.leadingAnchor.constraint(equalTo: urlLabel.trailingAnchor, constant: 10),
                    urlText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                    urlText.heightAnchor.constraint(equalTo: urlLabel.heightAnchor)
                ]
            )
        } else {
            urlText.numberOfLines = 1
            NSLayoutConstraint.activate(
                [
                    urlLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
                    urlLabel.leadingAnchor.constraint(equalTo: photo.leadingAnchor),
                    urlLabel.widthAnchor.constraint(equalToConstant: 40),
                    urlLabel.heightAnchor.constraint(equalToConstant: 20),
                    urlText.topAnchor.constraint(equalTo: urlLabel.topAnchor),
                    urlText.leadingAnchor.constraint(equalTo: urlLabel.trailingAnchor, constant: 10),
                    urlText.trailingAnchor.constraint(equalTo: photo.trailingAnchor),
                    urlText.heightAnchor.constraint(equalTo: urlLabel.heightAnchor)
                ]
            )
        }
    }
}

extension PhotoDetailsViewController: PhotoDetailsView {

    func startLoading() {
        activityIndicator.startAnimating()
    }

    func endLoading() {
        activityIndicator.stopAnimating()
    }
    
    func loadImage() {
        guard let url = photoDetails?.url else { fatalError() }
        presenter?.getImage(url: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(_): self.photo.image = #imageLiteral(resourceName: "noImage")
            case .success(let image): self.photo.image = image
            }
        }
    }
}

protocol PhotoDetailsView: AnyObject {
    var presenter: PhotoDetailsViewPresenter? { get set }
    var photoDetails: PhotoDetails? { get set }
    
    func startLoading()
    func endLoading()
    func loadImage()
}
