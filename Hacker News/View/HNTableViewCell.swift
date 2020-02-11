//
//  WebViewTableViewCell.swift
//  Hacker News
//
//  Created by User on 2/10/20.
//  Copyright © 2020 jonathanking. All rights reserved.
//

import UIKit

class HNTableViewCell: UITableViewCell {
    
    var story: Story? {
        didSet {
            updateUI()
        }
    }

    fileprivate func updateUI() {
        textLabel?.text = story?.title
        detailTextLabel?.text = story?.description
    }

}
