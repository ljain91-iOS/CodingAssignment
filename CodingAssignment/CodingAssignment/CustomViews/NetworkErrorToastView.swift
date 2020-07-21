//
//  NetworkErrorToastView.swift
//  CodingAssignment
//
//  Created by Lokesh Jain on 21/07/20.
//  Copyright © 2020 Lokesh. All rights reserved.
//

import UIKit

class NetworkErrorToastView: UIView {
  
  private var toastTitle = UILabel(frame: .zero)
  
  // Set Up Toast View
  func setUpViewWithText(text: String) {
    self.backgroundColor = .red
    toastTitle.text = text
    toastTitle.font = .preferredFont(forTextStyle: .headline)
    toastTitle.adjustsFontForContentSizeCategory = true
    toastTitle.textColor = .white
    toastTitle.translatesAutoresizingMaskIntoConstraints = false
    addSubview(toastTitle)
    
    toastTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
    toastTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
    toastTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    toastTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
  }
}
