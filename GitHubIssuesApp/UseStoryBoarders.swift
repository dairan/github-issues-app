//
//  UsarStoryBoarders.swift
//  GitHubIssuesApp
//
//  Created by Dairan T on 18/01/20.
//  Copyright © 2020 mobidevel. All rights reserved.
//

import UIKit

/// Allow use storyoars with Coordinator
protocol UseStoryBoarders {
  static func instantiate() -> Self
}

extension UseStoryBoarders {
//  Get class name. Atention: it's mandatory set up storyboard name at storyboards.
  static func instantiate() -> Self {
    let id = String(describing: self)
    let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
    return storyBoard.instantiateViewController(withIdentifier: id) as! Self
  }
}
