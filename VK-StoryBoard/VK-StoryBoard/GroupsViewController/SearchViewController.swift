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
        Group(name: "Наука и техника", photoProfile: "scince"),
        Group(name: "Wylsacom", photoProfile: "wylsa"),
        Group(name: "MediaZone", photoProfile: "media"),
        Group(name: "OZON Маркетплэйс", photoProfile: "ozon"),
        Group(name: "Космос просто", photoProfile: "space"),
        Group(name: "Apple", photoProfile: "apple"),
        Group(name: "Google", photoProfile: "google"),
        Group(name: "Yandex", photoProfile: "yandex"),
        Group(name: "GeekBrains", photoProfile: "geek"),
        Group(name: "No name", photoProfile: nil)
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Регистрация ячейки
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: searchViewControllerIdentifier)
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
        
        cell.configurate(name: group.name, imgProfile: UIImage(named: group.photoProfile ?? "default")) // Конфигурируем ячейку
        
        return cell
    }
    
    // Переход по сеге при нажатии на ячейку
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "addGroup", sender: nil)
    }
}
