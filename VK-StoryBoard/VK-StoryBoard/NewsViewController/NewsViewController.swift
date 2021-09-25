//
//  NewsViewController.swift
//  VK-StoryBoard
//
//  Created by Андрей Волков on 01.09.2021.
//

import UIKit

class NewsViewController: UIViewController {
    
    
    // Идентификатор контроллера
    let newsViewControllerIdentifier = "newsViewControllerIdentifier"
    
    // Аутлет таблицы
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Регистрация ячейки
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: newsViewControllerIdentifier)
        
        // Убираем полоски между пустыми ячейками
        self.tableView.tableFooterView = UIView()
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Количество ячеек
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    // Создание ячейки и ее конфигурация
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: newsViewControllerIdentifier, for: indexPath) as? NewsTableViewCell
        else { return UITableViewCell() }
        
        // Стиль и анимация выбора ячейки убрана
        cell.selectionStyle = .none
        
        // Конфигурация ячейки
        cell.configurate(post: posts[indexPath.row], indexPath: indexPath.row)
        
        return cell
    }
}
