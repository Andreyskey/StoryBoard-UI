//
//  GroupsViewController.swift
//  VK-StoryBoard
//
//  Created by Андрей Волков on 31.08.2021.
//

import UIKit

class GroupsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // Идентификатор контроллера
    let groupsViewControllerIdentifier = "groupsViewControllerIdentifier"
    
    // Массив групп в которых состоит пользователь
    var groups = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        // Регистрация ячейки
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: groupsViewControllerIdentifier)
    }
    
    @IBAction func selectGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" { // Проверяем идентификатор сеги
            let searchGroup = segue.source as? SearchViewController // получаем доступ к контроллеру
            if let indexPath = searchGroup?.tableView.indexPathForSelectedRow { // получаем индекс нажатой ячейки
                guard let group = searchGroup?.groups[indexPath.row] // получаем данные ячейки
                else { return }
                for item in groups {
                    if item.name == group.name && item.photoProfile == group.photoProfile { return } // проверяем на повторение ячеек
                }
                groups.append(group) // Добавляем в массив
                tableView.reloadData() // Подгружаем новые данные на контроллер
            }
        }
        
    }

}

extension GroupsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count // Количество ячеек в секции
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // Количество секций
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: groupsViewControllerIdentifier, for: indexPath) as? TableViewCell
        else { return TableViewCell() } // Создаем ячейку
        
        let group = groups[indexPath.row] // Получаем группу из индекса ячейки
        
        cell.configurate(name: group.name, imgProfile: UIImage(named: group.photoProfile ?? "default")) // Конфигурируем ячейку
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row) // Удаляем из массива группу под индексом ячейки
            tableView.deleteRows(at: [indexPath], with: .fade) // Удаляем ячейку с анимацией
        }
    }
    
}
