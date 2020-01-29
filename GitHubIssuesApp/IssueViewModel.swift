//
//  IssueViewModel.swift
//  DairanRecrutamento
//
//  Created by Dairan T on 19/01/20.
//  Copyright © 2020 mobidevel. All rights reserved.
//

import AlamofireImage
import UIKit

struct IssueViewModel {

  // MARK: - Properties
  //  closure to update table after new content.
  var updateAvatar: (() -> Void)?

  let issue: Issue

  var title: String {
    return issue.title
  }

  var body: String {
    return issue.body
  }

  var createdAtFormatted: String {

    let isoFormatter = ISO8601DateFormatter()
    guard let date = isoFormatter.date(from: issue.createdAt) else { return "" }

    let dateformatter = DateFormatter()
    dateformatter.locale = Locale.current
    dateformatter.dateStyle = .medium
    dateformatter.timeStyle = .medium
    return dateformatter.string(from: date)
  }

  var callOut: String {
    let texto = NSLocalizedString(issue.state, comment: "")
    return "\(self.createdAtFormatted) || \(texto.uppercased())"
  }

  var htmlURL: URL? {
    return URL(string: issue.htmlUrl) ?? nil
  }

  var state: String {
    return NSLocalizedString(issue.state, comment: "")
  }

  var stateImage: UIImage? {
    return UIImage(named: "issue-\(issue.state)-64") ?? nil
  }
  var stateTintColor: UIColor {
    if issue.state == "open" {
      return UIColor(named: "open") ?? UIColor.green
    }
    return UIColor(named: "closed") ?? UIColor.red
  }

  var avatarURL: URL? {
    return URL(string: issue.user.avatarUrl)
  }

  // MARK: - Initializers
  init(issue: Issue) {
    self.issue = issue
  }
}

// MARK: - Extension
extension UIImageView {
  /// Return avatar's url
  /// - Parameter withURL: a opcional of url user's avatar
  func avatarURL(withURL: URL?) {
    guard let url = withURL else { return }

    let size = CGSize(width: 100, height: 100)
    self.af_setImage(withURL: url,
                     placeholderImage: #imageLiteral(resourceName: "issue-user-52"),
                     filter: AspectScaledToFillSizeCircleFilter(size: size),
                     imageTransition: .crossDissolve(0.2)
    )}
}
