//
//  TableViewControllerSpecs.swift
//  DairanRecrutamentoTests
//
//  Created by Dairan T on 19/01/20.
//  Copyright © 2020 mobidevel. All rights reserved.
//

import Nimble
import Quick

@testable import DairanRecrutamento

class ViewControllerSpecs: QuickSpec {
  override func spec() {

    var sut: ListViewController!
    var modelView: IssueListViewModel!

    describe("The 'Table View Controller'") {
      context("Can show the correct labels text") {

        afterEach {
          sut = nil
        }

        beforeEach {
          modelView = IssueListViewModel()
          modelView.fetch()
          sut = ListViewController.instantiate() // get ViewController
          _ = sut.view // loading ViewController
          sut.loadViewIfNeeded() // call viewDidLoad method
        }

        
//        it("numero de row"){
//          expectation(description: <#T##String#>)
//        }

      }
    }
  }
}
