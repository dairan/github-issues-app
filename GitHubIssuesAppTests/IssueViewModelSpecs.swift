//
//  ViewModelsSpecs.swift
//  DairanRecrutamentoTests
//
//  Created by Dairan T on 19/01/20.
//  Copyright © 2020 mobidevel. All rights reserved.
//

import Nimble
import Quick

@testable import DairanRecrutamento

class IssueViewModelSpecs: QuickSpec {

  override func spec() {

    var issue: Issue!
    var sut: IssueViewModel!

    describe("Check if Issue ListViewModel") {
      context("Can be evaluated") {

        afterEach {
          sut = nil
        }

        beforeEach {
          /// Loading json from file
          if let path = Bundle(for: type(of: self)).path(forResource:"issues_correct", ofType: "json") {
            do {
              let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
              let decoder = JSONDecoder()
              issue = try decoder.decode([Issue].self, from: data).first
              sut = IssueViewModel(issue: issue)
            } catch {
              fail("Problem parsing JSON")
            }
          }
        }

        it("compare sut.title with modelView.title") {
          expect(sut.title).to(equal(issue.title))
        }
        it("compare sut.body with issue.boy") {
          expect(sut.body).to(equal(issue.body))
        }
        it("compare sut.callOut with issue.callOut") {
          expect(sut.callOut).to(equal("\(sut.createdAtFormatted) || \(issue.state.uppercased())"))
        }
        it("verify if colo is from open or closed") {
          let openColor = UIColor(named: "open")
          let closedColor = UIColor(named: "closed")
          expect(sut.stateTintColor).to(satisfyAnyOf(equal(openColor) || equal(closedColor)))
        }
        it("compare formatted date. ATENTION: check json and locale") {
          let date = "Jan 18, 2020 at 11:50:25 PM"
          expect(sut.createdAtFormatted).to(equal(date))
        }
        it("check if it is create right imagem conform issue state") {
          let image = UIImage(named: "issue-\(issue.state)-64")
          expect(sut.stateImage).to(equal(image))
        }
      }
    }
  }
}
