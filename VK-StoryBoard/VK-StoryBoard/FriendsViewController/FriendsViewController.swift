//
//  FriendsViewController.swift
//  VK-StoryBoard
//
//  Created by Андрей Волков on 31.08.2021.
//

import UIKit

class FriendsViewController: UIViewController {
    
    // Идентификатор контроллера
    var friendsViewControllerIdentifier = "friendsViewControllerIdentifier"
    
    @IBOutlet weak var tableVIew: UITableView!
    
    // Массив с друзьями пользователя
    var friends = [
        User(firstName: "Tim", lastName: "Cook", photo: [
            "tim1",
            "tim2",
            "tim3",
            "tim4"
        ], isFrom: "USA, Cupertino"),
        User(firstName: "Steve", lastName: "Jobs", photo: [
            "steve",
            "steve2",
            "steve3",
            "steve4"
        ], isFrom: "USA, California"),
        User(firstName: "Pavel", lastName: "Durov", photo: [
            "pavel",
            "pavel2",
            "pavel3",
            "pavel4"
        ], isFrom: "Russia, St. Petersburg"),
        User(firstName: "Donald", lastName: "Trump", photo: [
            "trump",
            "trump2",
            "trump3",
            "trump4"
        ], isFrom: "USA, Washington"),
        User(firstName: "Anonim", lastName: "Anon", photo: nil),
        User(firstName: "Kate", lastName: "Clapp", photo: nil),
        User(firstName: "Katy", lastName: "Parry", photo: nil),
        User(firstName: "Billy", lastName: "Eilish", photo: nil),
        User(firstName: "Даша", lastName: "Копарина", photo: nil),
        User(firstName: "Андрей", lastName: "Волков", photo: nil),
        User(firstName: "Дима", lastName: "Валуев", photo: nil),
        User(firstName: "Тима", lastName: "Беларусских", photo: nil),
        User(firstName: "Екатерина", lastName: "Храбрых", photo: nil),
        User(firstName: "Арина", lastName: "Лебедева", photo: nil),
        User(firstName: "Steve", lastName: "Voznayk", photo: nil),
        User(firstName: "Mark", lastName: "Redmer", photo: nil),
        User(firstName: "Любовь", lastName: "Соболь", photo: nil),
    ]
    
    
    func arrayLetter() -> [String] {
        // Пустой массив букв
        var resultArray = [String]()
        
        // Добавляем в массив первые буквы всех фамилий без повторений
        for item in friends {
            let firstLetter = String(item.lastName.prefix(1))
            if !resultArray.contains(firstLetter) {
                resultArray.append(firstLetter)
            }
        }
        
        // Сортируем по алфавиту
        let sortedResultArray = resultArray.sorted() {$0 < $1}
        
        return sortedResultArray
    }
    
    func arrayByLetter(letter: String) -> [User] {
        
        // Создаем массив друзей с одинаковой первой буквой фамилии
        var resultArray = [User]()
        
        // Добавляем в массив
        for item in friends {
            let firstLetter = String(item.lastName.prefix(1))
            if firstLetter == letter {
                resultArray.append(item)
            }
        }
        
        return resultArray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVIew.dataSource = self
        tableVIew.delegate = self
        
        // Убираем полосы у пустых ячеек
        self.tableVIew.tableFooterView = UIView()
        
        // Регистрация ячейки
        tableVIew.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: friendsViewControllerIdentifier)
    }
    
}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayLetter().count
    }
    
    // Количество ячеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayByLetter(letter: arrayLetter()[section]).count
    }
    
    // Создание ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: friendsViewControllerIdentifier, for: indexPath) as? TableViewCell
        else { return UITableViewCell() }
        
        let friend = arrayByLetter(letter: arrayLetter()[indexPath.section])
        
        let name = friend[indexPath.row].firstName + " " + friend[indexPath.row].lastName
        
        cell.configurate(fullName: name, imgProfile: UIImage(named: friend[indexPath.row].photo?[0] ?? "default"), description: friend[indexPath.row].isFrom)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrayLetter()[section].uppercased()
    }
    
    // Переход по конкретной сеге при нажатии на ячейку
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPhotos", sender: indexPath)
        
        // Убираем анимацию нажатия
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Передаем данные при переходе на другой контроллер
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PhotosViewController {
            let indexPath = sender as! IndexPath
            destination.friend = arrayByLetter(letter: arrayLetter()[indexPath.section])[indexPath.row]
        }
    }
    
}
