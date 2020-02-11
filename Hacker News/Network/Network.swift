//
//  Network.swift
//  Hacker News
//
//  Created by User on 2/5/20.
//  Copyright © 2020 jonathanking. All rights reserved.
//

import Foundation
import Alamofire

class Network {
    
    static func fetch<T: Decodable>(_ url: String, completion: @escaping (Swift.Result<T, Error>) -> Void) {
        
        AF.request(url).response { (response) in
            
            do {
                if let data = response.data {
                    let object = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(object))
                }
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    
}
