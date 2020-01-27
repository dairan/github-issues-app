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
  var htmlURL: String
  var state: String

  enum CodingKeys: String, CodingKey  {
    case title, user, body, state
    case createdAt = "created_at"
    case htmlURL = "html_url"
  }
}

struct User: Decodable {
  let avatarURL: String

  enum CodingKeys: String, CodingKey {
    case avatarURL = "avatar_url"
  }
}
