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

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBaseURL() {
        XCTAssertEqual(APIRouter.url(for: .topStories), "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
