//
//  UIKit+loadingIndicator.swift
//  GitHubIssuesApp
//
//  Created by Dairan T on 19/01/20.
//  Copyright © 2020 mobidevel. All rights reserved.
//

import AlamofireNetworkActivityIndicator

extension UITableViewController {

  /// Configurate activity indicator
  var loadingSetup: UIActivityIndicatorView {
    let loadingActivity = UIActivityIndicatorView(style: .large)
    loadingActivity.color = .white
    loadingActivity.center = self.view.center
    loadingActivity.hidesWhenStopped = true
    return loadingActivity
  }

func loadingIndicator() {

  let loadingActivity = loadingSetup
  self.view.addSubview(loadingActivity)
  /// Monitor activity of requests
   NetworkActivityIndicatorManager.shared.networkActivityIndicatorVisibilityChanged = { status in
    if status {
      loadingActivity.startAnimating()
      loadingActivity.isHidden = false
    } else {
      loadingActivity.stopAnimating()
    }
  }
}
}
