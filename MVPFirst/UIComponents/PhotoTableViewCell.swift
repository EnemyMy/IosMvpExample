//
//  PhotoTableViewCell.swift
//  MVPFirst
//
//  Created by Алексей on 08.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

final class PhotoTableViewCell: UITableViewCell {
    
    let photo = UIImageView()
    let title = UILabel()
    var imageURL = ""

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photo.image = nil
        title.text = nil
    }
    
    private func setupViews() {
        setupPhoto()
        setupTitle()
    }
    
    private func setupPhoto() {
        photo.contentMode = .scaleAspectFill
        photo.clipsToBounds = true
        contentView.addSubview(photo)
        photo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                photo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
                photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                photo.widthAnchor.constraint(equalTo: photo.heightAnchor)
            ]
        )
    }
    
    private func setupTitle() {
        title.numberOfLines = 0
        title.lineBreakMode = .byTruncatingTail
        contentView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                title.topAnchor.constraint(equalTo: photo.topAnchor),
                title.bottomAnchor.constraint(equalTo: photo.bottomAnchor),
                title.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
                title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
            ]
        )
    }
}
