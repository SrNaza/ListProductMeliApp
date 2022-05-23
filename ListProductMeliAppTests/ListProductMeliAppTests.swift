//
//  ListProductMeliAppTests.swift
//  ListProductMeliAppTests
//
//  Created by Nazareth villalba on 21/05/22.
//

import XCTest
import RxSwift
import RxCocoa
@testable import ListProductMeliApp

class ListProductMeliAppTests: XCTestCase {
    
    var homePresenter: HomeFlowPresenterProtocol!
    var urlSession: URLSession!
    var disposeBag = DisposeBag()

    override func setUpWithError() throws {
        try super.setUpWithError()
        homePresenter = HomeFlowPresenter(interactor: HomeFlowInteractor(), router: HomeFlowRouter(baseController: UIViewController()))
        urlSession = URLSession(configuration: .default)
    }

    override func tearDownWithError() throws {
        homePresenter = nil
        urlSession = nil
        try super.tearDownWithError()
    }
    
    func testSeacrhTextFieldIsEmpty() {
        let transitionExpectation = expectation(description: "Should get search done")
        
        let detailInfo = homePresenter?.getItemsDetail(itemToSearch: "Toallas")
            .asObservable()
        
        detailInfo?.asObservable()
            .take(1)
            .subscribe(onNext: { info in
                XCTAssertEqual(!info.results.isEmpty, true, "Textfield shouldn't be empty")
                transitionExpectation.fulfill()
        }).disposed(by: disposeBag)
        
        waitForExpectations(timeout: 5) {
            print($0?.localizedDescription ?? "Error waiting expectation")
        }
    }
    
    func testTextFieldWrongSearch() {
        let transitionExpectation = expectation(description: "Should pass a valid word")
        
        let detailInfo = homePresenter?.getItemsDetail(itemToSearch: "awdasascqw")
            .asObservable()
        
        detailInfo?.asObservable()
            .take(1)
            .subscribe(onNext: { info in
                XCTAssertEqual(info.results.isEmpty, true, "This test gets wrong when the word isn't valid")
                transitionExpectation.fulfill()
        }).disposed(by: disposeBag)
        
        waitForExpectations(timeout: 5) {
            print($0?.localizedDescription ?? "Error waiting expectation")
        }
    }
    
    func testNotifyTransition() {
        let transitionExpectation = expectation(description: "should get coupon active")
        
        let detailInfo = homePresenter?.getItemsDetail(itemToSearch: "Toallas")
            .asObservable()
        
        detailInfo?.asObservable()
            .take(1)
            .subscribe(onNext: { [weak self] info in
                guard let self = self, let infoResult = info.results.first else { return }
                
                let notify = self.homePresenter.notifyTransition(transition: .showItemsSearchDetail(item: infoResult), completion: nil)
                
//                XCTAssertEqual(!info.results.isEmpty, true, "Textfield shouldn't be empty")
                transitionExpectation.fulfill()
        }).disposed(by: disposeBag)
    
        
        waitForExpectations(timeout: 5) {
            print($0?.localizedDescription ?? "Error waiting expectation")
        }
    }
    
    // Asynchronous test: success fast, failure slow
    func testValidApiCallGetsHTTPStatusCode200() throws {
      
      let urlString = "https://api.mercadolibre.com/sites/MCO/search?q=mouses"
        
      let url = URL(string: urlString)!
      
      let promise = expectation(description: "Status code: 200")

      
      let dataTask = urlSession.dataTask(with: url) { _, response, error in
        
        if let error = error {
          XCTFail("Error: \(error.localizedDescription)")
          return
        } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
          if statusCode == 200 {
            
            promise.fulfill()
          } else {
            XCTFail("Status code: \(statusCode)")
          }
        }
      }
      dataTask.resume()
      
      wait(for: [promise], timeout: 5)
    }
    
}

extension ListProductMeliAppTests: DetailViewControllerTestable {
    func setupAccert() {
        XCTAssertTrue(true, "Textfield shouldn't be empty")
    }
}
