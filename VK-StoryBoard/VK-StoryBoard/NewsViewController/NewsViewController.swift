//
//  NewsViewController.swift
//  VK-StoryBoard
//
//  Created by Андрей Волков on 01.09.2021.
//

import UIKit

class NewsViewController: UIViewController {
    
    let newsViewControllerIdentifier = "newsViewControllerIdentifier"
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [
        Post(group: SearchViewController().groups[0], descriptionPost: "Павел Дуров создал Telegram", imagePost: [#imageLiteral(resourceName: "pavel3")]),
        Post(group: SearchViewController().groups[1], descriptionPost: "Айфоны очень крутые, андроиду еще далеко до них", imagePost: []),
        Post(group: SearchViewController().groups[2], descriptionPost: "День рождения Павла Дурова", imagePost: [#imageLiteral(resourceName: "pavel2"), #imageLiteral(resourceName: "scince")]),
        Post(group: SearchViewController().groups[3], descriptionPost: "Яндекс стал нашим официальным партнером", imagePost: [#imageLiteral(resourceName: "yandex"), #imageLiteral(resourceName: "steve2"), #imageLiteral(resourceName: "media")]),
        Post(group: SearchViewController().groups[4], descriptionPost: "Тим Кук и Илон Маск договорились о создании общего проекта по освоению марса", imagePost: [#imageLiteral(resourceName: "tim3"), #imageLiteral(resourceName: "pavel2"), #imageLiteral(resourceName: "google"), #imageLiteral(resourceName: "geek")]),
        Post(group: SearchViewController().groups[5], descriptionPost: "Apple поздравялет Павла дурова с Днем рождения", imagePost: [#imageLiteral(resourceName: "pavel2"), #imageLiteral(resourceName: "scince"), #imageLiteral(resourceName: "trump3"), #imageLiteral(resourceName: "space"), #imageLiteral(resourceName: "media"), #imageLiteral(resourceName: "pavel"), #imageLiteral(resourceName: "steve4")])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: newsViewControllerIdentifier)
        
        self.tableView.tableFooterView = UIView()
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: newsViewControllerIdentifier, for: indexPath) as? NewsTableViewCell
        else { return NewsTableViewCell() }
        
        cell.selectionStyle = .none
        
        cell.configurate(post: posts[indexPath.row])
        
        return cell
    }
}
