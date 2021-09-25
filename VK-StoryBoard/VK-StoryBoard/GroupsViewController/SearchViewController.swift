//
//  SearchViewController.swift
//  VK-StoryBoard
//
//  Created by Андрей Волков on 31.08.2021.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //
    var searchFlag = false
    
    
    // Идентификатор контроллера
    var searchViewControllerIdentifier = "searchViewControllerIdentifier"
    
    // Массив всех существующих групп
    var groups = [
        Group(name: "Наука и техника", photoProfile: UIImage(named: "scince"), topicGroup: "Наука"),
        Group(name: "Wylsacom", photoProfile: UIImage(named: "wylsa"), topicGroup: "IT"),
        Group(name: "MediaZone", photoProfile: UIImage(named: "media"), topicGroup: "СМИ"),
        Group(name: "OZON Маркетплэйс", photoProfile: UIImage(named: "ozon"), topicGroup: "Торговля"),
        Group(name: "Космос просто", photoProfile: UIImage(named: "space"), topicGroup: "Наука"),
        Group(name: "Apple", photoProfile: UIImage(named: "apple"), topicGroup: "Компания"),
        Group(name: "Google", photoProfile: UIImage(named: "google"), topicGroup: "Компания"),
        Group(name: "Yandex", photoProfile: UIImage(named: "yandex"), topicGroup: "Компания"),
        Group(name: "GeekBrains", photoProfile: UIImage(named: "geek"), topicGroup: "Образование"),
        Group(name: "No name", photoProfile: nil, topicGroup: nil)
    ]
    
    var filtredGroups = [Group]()
    
    func arrayGroups() -> [Group] {
        if searchFlag {
            return filtredGroups
        } else {
            return groups
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        
        // Регистрация ячейки
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: searchViewControllerIdentifier)
        
        self.tableView.tableFooterView = UIView()
    }
    

}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
// MARK: - TableView Settings
    
    // Количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Количество ячеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayGroups().count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: searchViewControllerIdentifier, for: indexPath) as? TableViewCell
        else { return UITableViewCell() } // Создаем ячейку
        
        let group = arrayGroups()[indexPath.row] // Получаем группу по индексу ячейкиц
        
        cell.configurate(fullName: group.name, imgProfile: group.photoProfile, description: group.topicGroup) // Конфигурируем ячейку
        
        return cell
    }
    
    // Переход по сеге при нажатии на ячейку
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "addGroup", sender: nil)
    }
    
// MARK: - SearchBar Settingswe
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searchFlag = false
        } else {
            searchFlag = true
            filtredGroups = groups.filter({ item in
                item.name.lowercased().contains(searchText.lowercased())
            })
        }
        tableView.reloadData()
    }
}
