//
//  c.swift
//  DairanRecrutamentoTests
//
//  Created by Dairan T on 19/01/20.
//  Copyright © 2020 mobidevel. All rights reserved.
//


import Foundation
import Nimble
import Quick

@testable import DairanRecrutamento

class IssueListViewModelSpecs: QuickSpec {

  override func spec() {

    var issues: [Issue]!
    var sut: IssueListViewModel!


    describe("Check if Issue IssueListViewModel") {
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
              issues = try decoder.decode([Issue].self, from: data)
              sut = IssueListViewModel()
              sut.issues = issues
            } catch {
              fail("Problem parsing JSON")
            }
          }
        }

        it("number of rows are equal to issues.count") {
          expect(sut.numberRowsInSection).to(equal(issues.count))
        }

        it("issue create is equal to isse at json file.") {
          expect(sut.issuesAtIndex(0)?.title).to(equal(issues.first?.title))
        }
      }
    }
  }
}
