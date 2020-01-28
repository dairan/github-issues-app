//
//  MinhaTableViewController.swift
//  GitHubIssuesApp
//
//  Created by Dairan T on 18/01/20.
//  Copyright © 2020 mobidevel. All rights reserved.
//

import UIKit

/// Issues list's TableView with protocol
class ListViewController: UITableViewController, UseStoryBoarders {

  // MARK: - Properties
  weak var appCoordenator: MainAppCoordinator?
  lazy var modelView: IssueListViewModel = {
    return IssueListViewModel()
  }()

  // MARK: - Interface Buttons
  @IBOutlet weak var pullToUpdateRefresh: UIRefreshControl!
  @IBAction func valueChangedRefreshControl(_ sender: UIRefreshControl) {
    sender.beginRefreshing()
    modelView.fetch()
    print("========:  atualizando...")
  }

  // MARK: - Life cycle of view
  override func viewDidLoad() {
    super.viewDidLoad()

    self.loadingIndicator()

    modelView.fetch()
    modelView.updateContent = {() in
      DispatchQueue.main.async {
        self.tableView.reloadData()
        self.pullToUpdateRefresh.endRefreshing()
        print("========:  terminou atualizar")
      }
    }
  }

  // MARK: - Table view data source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return modelView.numberRowsInSection
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let issueModelView = modelView.issuesAtIndex(indexPath.row) else { fatalError() }

    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.issueCellId, for: indexPath)
    cell.textLabel?.text = issueModelView.title
    cell.detailTextLabel?.text = issueModelView.callOut
    cell.imageView?.image = issueModelView.stateImage
    cell.tintColor = issueModelView.stateTintColor

    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let issue = modelView.issuesAtIndex(indexPath.row) else { return }
    appCoordenator?.detailsVC(with: issue)
  }
}
