//
//  IssueSpecs.swift
//  DairanRecrutamentoTests
//
//  Created by Dairan T on 19/01/20.
//  Copyright © 2020 mobidevel. All rights reserved.
//

import Nimble
import Quick

@testable import DairanRecrutamento

class IssueSpecs: QuickSpec {

  override func spec() {
    var sut: [Issue]!
    describe("Check if GitHub issues model") {
      context("Can be created with valid JSON") {

        afterEach {
          sut = nil
        }
        
        beforeEach {
          /// Loading json from file
          if let path = Bundle(for: type(of: self)).path(forResource:"issues_correct", ofType: "json") {
            do {
              let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
              let decoder = JSONDecoder()
              sut = try decoder.decode([Issue].self, from: data)
            } catch {
              fail("Problem parsing JSON")
            }
          }
        }

        it("can parse the correct createdAt date") {
          expect(sut.first?.createdAt).to(equal("2020-01-19T02:50:25Z"))
        }
        it("can parse the correct title") {
          expect(sut.first?.title).to(equal("[Build System: Python] Test restructure"))
        }
        it("can parse the correct body") {
          expect(sut.first?.body).to(equal("This PR restructures the Python testing for `utils/build_swift` to mirror the module structure. Now tests for `utils/build_swift/build_swift` live in `utils/build_swift/tests/build_swift`. This allows for scripts in the top level of the module to also have tests that are not inter-mingled with the module tests.\r\n\r\nIn addition I've added new `run_tests.py` scripts to `swift_build_support` and `update_checkout` which use the standard `unittest` module to discover and execute the module tests. These scripts are then used by the validation test suite rather than having custom bash commands for each. This should be more reliable and discoverable for developers working on these modules/tools."))
        }
        it("can parse the correct htmlRUL") {
          expect(sut.first?.htmlURL).to(equal("https://github.com/apple/swift/pull/29306"))
        }
        it("can parse the correct state") {
          expect(sut.first?.state).to(equal("open"))
        }
        it("can parse the correct body.avatar") {
          expect(sut.first?.user.avatarURL).to(equal("https://avatars3.githubusercontent.com/u/862492?v=4"))
        }
      }
    }
  }
}
