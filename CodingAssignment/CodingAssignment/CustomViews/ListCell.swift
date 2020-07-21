//
//  ListCell.swift
//  CodingAssignment
//
//  Created by Lokesh Jain on 21/07/20.
//  Copyright © 2020 Lokesh. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
  
  var titleLabel = UILabel(frame: .zero)
  var descriptionLabel = UILabel(frame: .zero)
  var listImageView = UIImageView(image: UIImage(named: "no-photo"))
  
  // Set Image Height and Width as per screen size
  private var imageHeightConstant: CGFloat {
    if DeviceType.iPhone {
      return 60
    } else {
      return 70
    }
  }
  
}

// MARK: - UITableViewCell UI Configuration Methods
extension ListCell {
  // Configure all the Cell Elements
  func configureCellElements(with listDetailModel: ListDetailModel, networkingClient: WebServices, row: Int){
    // Setup ImageView
    setupListImageView(imageString: listDetailModel.imageHref, networkingClient: networkingClient, row: row)
    
    // Setup Title Label
    setupTitleLabel(titleString: listDetailModel.title)
    
    // Setup Description Label
    setupDescriptionLabel(descriptionString: listDetailModel.description)
  }
  
  // Configuration method for ListImageView
  private func setupListImageView(imageString: String, networkingClient: WebServices, row: Int) {
    listImageView.image = UIImage(named: "no-photo")
    listImageView.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(listImageView)
    
    // ListImageView Constraints
    listImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
    listImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    listImageView.heightAnchor.constraint(equalToConstant: imageHeightConstant).isActive = true
    listImageView.widthAnchor.constraint(equalToConstant: imageHeightConstant).isActive = true
  }
  
  // Configuration method for TitleLabel
  private func setupTitleLabel(titleString: String) {
    // Set font as per text style. No need to set FontSize
    titleLabel.font = .preferredFont(forTextStyle: .headline)
    titleLabel.adjustsFontForContentSizeCategory = true
    
    // Title Label text rendering configuration
    titleLabel.text = titleString
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(titleLabel)
    
    // Title Label Constraints
    titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: listImageView.trailingAnchor, constant: 10).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
  }
  
  // Configuration method for DescriptionLabel
  private func setupDescriptionLabel(descriptionString: String) {
    // Set font as per text style. No need to set FontSize
    descriptionLabel.font = .preferredFont(forTextStyle: .body)
    descriptionLabel.adjustsFontForContentSizeCategory = true
    
    // Description Label text rendering configuration
    descriptionLabel.text = descriptionString
    descriptionLabel.numberOfLines = 0
    descriptionLabel.lineBreakMode = .byWordWrapping
    descriptionLabel.textColor = .darkGray
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(descriptionLabel)
    
    // Description Label Constraints
    descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
    descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
    descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
    descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
  }
}
