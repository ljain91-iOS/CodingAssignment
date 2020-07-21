//
//  HTTPLayer.swift
//  CodingAssignment
//
//  Created by Lokesh Jain on 21/07/20.
//  Copyright © 2020 Lokesh. All rights reserved.
//

import Foundation

class HTTPLayer {
  // Enum to handle to API Url's and HTTP methods(POST, GET, PUT)
  enum HTTPMethod: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
  }
  
  enum Endpoint {
    case fetchList
    
    var path: String {
      switch self {
      case .fetchList:
        return Constants.baseUrl
      }
    }
    
    var httpMethod: HTTPMethod {
      switch self {
      case .fetchList:
        return .get
      }
    }
  }
  
  // MARK: - Request Method
  func request(at endpoint: Endpoint, completion: @escaping (Data?, URLResponse?, Error?)-> Void) {
    // URL Session Configuration
    let sessionConfiguration = URLSessionConfiguration.default
    sessionConfiguration.timeoutIntervalForResource = 45
    sessionConfiguration.timeoutIntervalForRequest = 45
    let urlSession = URLSession(configuration: sessionConfiguration)
    
    guard let url = URL(string: endpoint.path) else {return}
    var request = URLRequest(url: url)
    request.httpMethod = endpoint.httpMethod.rawValue
    
    // URL Session Task
    let task = urlSession.dataTask(with: request) { (data, response, error) in
      if let data = data {
        if endpoint.path == Constants.baseUrl {
          // Converted Data to String because data is not in correct .utf8 format
          if let jsonString = String(data: data, encoding: .isoLatin1) {
            // Converted String back to Data.
            // This data is passed to Decoder to populate Models
            guard let dataInUTF8Format = jsonString.data(using: .utf8) else { return }
            completion(dataInUTF8Format, response, error)
          }
        } else {
          completion(data, response, error)
        }
      } else {
        completion(data, response, error)
      }
    }
    task.resume()
  }
}
