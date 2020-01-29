//
//  IssueModel.swift
//  GitHubIssuesApp
//
//  Created by Dairan T on 16/01/20.
//  Copyright © 2020 mobidevel. All rights reserved.
//

import Foundation

/// Model Issue
struct Issue: Decodable {
  var title: String
  var createdAt: String
  var user: User
  var body: String
  var htmlUrl: String
  var state: String
}

struct User: Decodable {
  let avatarUrl: String
}
