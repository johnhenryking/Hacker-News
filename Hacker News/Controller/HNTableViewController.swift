//
//  ViewController.swift
//  Hacker News
//
//  Created by User on 2/5/20.
//  Copyright © 2020 jonathanking. All rights reserved.
//

import UIKit

class HNTableViewController: UITableViewController {
    
    var stories = [Story]()
    let reuseIdentifier = "hackerNewsCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchStories()
    }
    
    fileprivate func fetchStories() {
        
        let url = APIRouter.url(for: .topStories)
        
        Network.fetch(url) { [unowned self] (result: Result<[Int], Error>) in
            switch result {
            case .success(let stories):
                let limit = 10 // amount of stories you would like displayed
                let sortedStories = stories.sorted()
                for number in 0...limit {
                    let id = sortedStories[number]
                    self.fetchIndividualStory(with: id)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    fileprivate func fetchIndividualStory(with id: Int) {
        
        let url = APIRouter.url(for: .story, with: id)
        
        Network.fetch(url) { [unowned self] (result: Result<Story, Error>) in
            switch result {
            case .success(let story):
                self.tableView.beginUpdates()
                
                self.stories.insert(story, at: 0)
                self.tableView.insertRows(at:[ [0,0]], with: .automatic)
                
                self.tableView.endUpdates()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - PREPARE FOR SEGUE
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "webView", let webViewVC = segue.destination as? WebViewController, let indexPath = tableView.indexPathForSelectedRow else { return }
        webViewVC.urlString = stories[indexPath.row].url
        webViewVC.navigationItem.title = stories[indexPath.row].title
    }
    

}

// MARK: -TABLEVIEW DELEGATE METHODS

extension HNTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        guard let  hackerNewsCell = cell as? HNTableViewCell else { return cell }
        let story = stories[indexPath.row]
        hackerNewsCell.story = story
        return cell
    }
    
    
}

extension HNTableViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .black
    }
}




