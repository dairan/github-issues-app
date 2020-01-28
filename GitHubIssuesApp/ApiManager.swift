//
//  ApiManager.swift
//  DairanRecrutamento
//
//  Created by Dairan T on 18/01/20.
//  Copyright © 2020 mobidevel. All rights reserved.
//

import Alamofire
import Foundation

protocol ApiManagerProtocol {
  func fetchIssues(onPage page: Int, completionHandler: @escaping (Swift.Result<[Issue], Error>) -> Void)
}

class ApiManager: ApiManagerProtocol {

  typealias CompletionHandler = Swift.Result<[Issue], Error>

  /// Fetch data from GitHub
  /// - Parameters:
  ///   - page: pagination - TODO
  ///   - completionHandler: closure.
  func fetchIssues(onPage page: Int = 1, completionHandler: @escaping (CompletionHandler) -> Void) {

    // Alamorifre's URL parameters
    let urlParams = [
      "state": "all",
      "page": String(page),
    ]

    request(Constants.hostURL, method: .get, parameters: urlParams)
      .validate(statusCode: 200..<299)
      .validate(contentType: ["application/json"])
      .responseData { (response) in
        switch response.result {
        case .success( let data):
          let issues = self.decodification(with: data)
          completionHandler(.success(issues))
          print("========:  dados coletados e enviado para tableview")
        case .failure(let error):
          print(error.localizedDescription)
        }
    }
  }

  func decodification(with data: Data) -> [Issue] {
    let decoder = JSONDecoder()
    do {
      let issues = try decoder.decode([Issue].self, from: data)
      return issues
    } catch let erro {
      print("========:  ERRO", erro.localizedDescription)
      return []
    }
  }
}
