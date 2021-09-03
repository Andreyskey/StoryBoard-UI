//
//  SearchViewController.swift
//  VK-StoryBoard
//
//  Created by Андрей Волков on 31.08.2021.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // Идентификатор контроллера
    var searchViewControllerIdentifier = "searchViewControllerIdentifier"
    
    // Массив всех существующих групп
    var groups = [
        Group(name: "Наука и техника", photoProfile: "scince", topicGroup: "Наука"),
        Group(name: "Wylsacom", photoProfile: "wylsa", topicGroup: "IT"),
        Group(name: "MediaZone", photoProfile: "media", topicGroup: "СМИ"),
        Group(name: "OZON Маркетплэйс", photoProfile: "ozon", topicGroup: "Торговля"),
        Group(name: "Космос просто", photoProfile: "space", topicGroup: "Наука"),
        Group(name: "Apple", photoProfile: "apple", topicGroup: "Компания"),
        Group(name: "Google", photoProfile: "google", topicGroup: "Компания"),
        Group(name: "Yandex", photoProfile: "yandex", topicGroup: "Компания"),
        Group(name: "GeekBrains", photoProfile: "geek", topicGroup: "Образование"),
        Group(name: "No name", photoProfile: nil, topicGroup: nil)
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Регистрация ячейки
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: searchViewControllerIdentifier)
        
        self.tableView.tableFooterView = UIView()
    }
    

}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Количество ячеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: searchViewControllerIdentifier, for: indexPath) as? TableViewCell
        else { return TableViewCell() } // Создаем ячейку
        
        let group = groups[indexPath.row] // Получаем группу по индексу ячейки
        
        cell.configurate(name: group.name, imgProfile: UIImage(named: group.photoProfile ?? "default"), description: group.topicGroup) // Конфигурируем ячейку
        
        return cell
    }
    
    // Переход по сеге при нажатии на ячейку
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "addGroup", sender: nil)
    }
}
