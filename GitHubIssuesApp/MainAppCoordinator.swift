//
//  PrincipalAppCoordenator.swift
//  GitHubIssuesApp
//
//  Created by Dairan T on 18/01/20.
//  Copyright © 2020 mobidevel. All rights reserved.
//

import UIKit

/// Main Coordinator
class MainAppCoordinator: AppCoordinator {

  // MARK: - Properties
  var childrenCoordinators = [AppCoordinator]()
  var navigationController: UINavigationController

  init(nav: UINavigationController) {
    self.navigationController = nav
  }

  // MARK: - Methods
  func start() {
    let vc = ListViewController.instantiate()
    vc.appCoordenator = self

    navigationController.navigationBar.prefersLargeTitles = true
    navigationController.pushViewController(vc, animated: true)
  }

  /// Details screen view setup
  /// - Parameter issue: modelView
  func detailsVC(with issue: IssueViewModel) {
    let vc = DetailsTableViewController.instantiate()
    vc.appCoordenator = self
    vc.issue = issue
    navigationController.pushViewController(vc, animated: true)
  }

}
