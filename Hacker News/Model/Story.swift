//
//  Story.swift
//  Hacker News
//
//  Created by User on 2/10/20.
//  Copyright © 2020 jonathanking. All rights reserved.
//

import Foundation

struct Story: Decodable {
    
    var by: String
    var descendants: Int
    var id: Int
    var kids: [Int]
    var score: Int
    var title: String
    var type: String
    var url: String
    
    var host: String {
        return URL(string: url)?.host ?? url
    }
    
    var description: String {
        return "\(score) points (\(host))"
    }
    
    
    
}
