//
//  DetailsTableViewController.swift
//  GitHubIssuesApp
//
//  Created by Dairan T on 18/01/20.
//  Copyright © 2020 mobidevel. All rights reserved.
//

import AlamofireImage
import UIKit

class DetailsTableViewController: UITableViewController, UseStoryBoarders {

  // MARK: - Properties
  weak var appCoordenator: MainAppCoordinator?
  var issue: IssueViewModel? {
    willSet {
      contentSetup()
    }
  }

  // MARK: - IBOutlets
  @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
  @IBOutlet weak var avatarImageView: UIImageView!
  @IBOutlet var textsLabel: [UILabel]!
  @IBOutlet weak var stateBackgroundView: UIView!

  // MARK: - IBActions
  @IBAction func openURLButtonTapped(_ sender: Any) {
    guard let url = issue?.htmlURL else { return }
    UIApplication.shared.open(url, options: [:], completionHandler: nil)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    loadingIndicator()
    navigationSetup()
    updateContent()
  }

  func navigationSetup() {
    self.navigationItem.largeTitleDisplayMode = .never
  }

  func updateContent() {
    issue?.updateAvatar = {() in
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }

  func contentSetup() {

    guard let issue = issue else { return }
    textsLabel[0].text = issue.createdAtFormatted
    textsLabel[1].text = issue.title
    textsLabel[2].text = issue.body

    let texto = NSLocalizedString("Status is", comment: "")
    textsLabel[3].text = "\(texto) \(issue.state)"

    stateBackgroundView.backgroundColor = issue.stateTintColor
    avatarImageView.avatarURL(withURL: issue.avatarURL)
  }
}
