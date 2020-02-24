//
//  APIProtocol.swift
//  Hacker News
//
//  Created by User on 2/22/20.
//  Copyright © 2020 jonathanking. All rights reserved.
//

import Foundation
import UIKit

protocol APIProtocol {
    func fetch<T: Decodable>(_ url: String, completion: @escaping (Swift.Result<T, Error>) -> Void)
}

