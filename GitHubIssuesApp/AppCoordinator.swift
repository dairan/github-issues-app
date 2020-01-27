//
//  AppCoordenator.swift
//  GitHubIssuesApp
//
//  Created by Dairan T on 18/01/20.
//  Copyright © 2020 mobidevel. All rights reserved.
//

import UIKit

protocol AppCoordinator {

  /// Coordinator design pattern protocol
  var childrenCoordinators: [AppCoordinator] { get set }
  var navigationController: UINavigationController { get set }

  func start()
}
