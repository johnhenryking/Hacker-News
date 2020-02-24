//
//  MockNetwork.swift
//  Hacker NewsTests
//
//  Created by User on 2/22/20.
//  Copyright © 2020 jonathanking. All rights reserved.
//

import Foundation
@testable import Hacker_News



class MockNetwork: APIProtocol {
    
    var canMakeNetworkCall = true
    
    var mockJson: [String:Any]  {
        return [
            "by": "pseudolus",
            "descendants": 75,
            "id": 22376298,
            "kids": [22376502, 22376470, 22377024, 22376520, 22376899, 22376712, 22376733, 22380295, 22377147, 22376816, 22383596, 22376532],
            "score": 77,
            "title": "Sweden’s central bank says it has begun testing an e-krona",
            "type": "story",
            "url": "https://www.reuters.com/article/us-cenbank-digital-sweden/sweden-starts-testing-worlds-first-central-bank-digital-currency-idUSKBN20E26G"

        ]
    }
    
    var mockStories: [Int] {
        return [ 22377677, 22377599, 22377176, 22387206, 22393598, 22385208, 22380235, 22378107, 22378078, 22392368, 22380935, 22381131, 22376028, 22395755, 22384488, 22381074, 22391293]
    }
    
    func fetch<T>(_ url: String, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        
        do {
            let mock: Any = url == APIRouter.url(for: .story) ? mockJson : mockStories
            let data = try JSONSerialization.data(withJSONObject: mock, options: .prettyPrinted)
            let object = try JSONDecoder().decode(T.self, from: data)
            completion(.success(object))
        } catch let error {
            completion(.failure(error))
        }
    }
    
    
}

