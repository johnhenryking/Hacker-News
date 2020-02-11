//
//  APIRouter.swift
//  Hacker News
//
//  Created by User on 2/10/20.
//  Copyright © 2020 jonathanking. All rights reserved.
//

import Foundation

struct APIRouter {
    
    enum URLType {
        case topStories, story
    }
    
    static func url(for urlType: URLType, with id: Int? = nil) -> String {
        switch urlType {
        case .topStories:
            return "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty"
        case .story:
            guard let id = id else { return "" }
            return  "https://hacker-news.firebaseio.com/v0/item/\(id).json?print=pretty"
        }
    }
    
}
