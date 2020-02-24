//
//  Hacker_NewsTests.swift
//  Hacker NewsTests
//
//  Created by User on 2/5/20.
//  Copyright © 2020 jonathanking. All rights reserved.
//

import XCTest
@testable import Hacker_News

class Hacker_NewsTests: XCTestCase {
    
    var queue: DispatchQueue = DispatchQueue(label: "test-queue-memory-leak", attributes: .concurrent)
    var expectation: XCTestExpectation!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //expectation = self.expectation(description: "memory-leak")
    }

    override func tearDown() {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBaseURL() {
        XCTAssertEqual(APIRouter.url(for: .topStories), "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty")
    }
    
    func testIndiviualStoryResults() {
        MockNetwork().fetch(APIRouter.url(for: .story)) { (result: Result<Story, Error>) in
            switch result {
            case .success(let story):
                print(story)
                XCTAssertNotNil(story)
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
            }
        }
    }
    
    func testMultipleStories() {
        MockNetwork().fetch(APIRouter.url(for: .topStories)) { (result: Result<[Int], Error>) in
            switch result {
            case .success(let stories):
                print(stories)
                XCTAssertNotNil(stories)
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
            }
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
