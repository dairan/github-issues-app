//
//  IssueViewModel.swift
//  GitHubIssuesApp
//
//  Created by Dairan T on 18/01/20.
//  Copyright © 2020 mobidevel. All rights reserved.
//

import UIKit

class IssueListViewModel {
  
  // MARK: - Properties
  private let apiManager: ApiManagerProtocol
  
  var updateContent: (() -> Void)?
  
  var issues: [Issue]? {
    didSet {
      self.updateContent?()
    }
  }
  
  var numberRowsInSection: Int {
    return issues?.count ?? 0
  }
  
  // MARK: - Initializer
  init(api: ApiManagerProtocol = ApiManager()) {
    self.apiManager = api
  }
  
  // MARK: - Functions
  func issuesAtIndex(_ index: Int) -> IssueViewModel? {
    guard let issue = issues?[index] else { return nil }
    return IssueViewModel(issue: issue)
  }
  
  func fetch() {
    apiManager.fetchIssues(onPage: 1) { (result) in
      switch result {
      case .success(let issues):
        self.issues = issues
      case .failure(let error):
        print("========:  ERROR", error.localizedDescription) // TODO: - alerta
      }
    }
  }
  
}

