//
//  Constants.swift
//  CodingAssignment
//
//  Created by Lokesh Jain on 21/07/20.
//  Copyright © 2020 Lokesh. All rights reserved.
//

import Foundation

struct Constants {
  #if RELEASE
  static let baseUrl = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
  #elseif DEBUG
  static let baseUrl = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
  #endif
  
  static let kAppName = "Coding Assignment"
}
