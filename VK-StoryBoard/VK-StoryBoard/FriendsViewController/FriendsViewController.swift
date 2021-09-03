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
        User(name: "Tim Cook", photo: [
            "tim1",
            "tim2",
            "tim3",
            "tim4"
        ], isFrom: "USA, Cupertino"),
        User(name: "Steve Jobs", photo: [
            "steve",
            "steve2",
            "steve3",
            "steve4"
        ], isFrom: "USA, California"),
        User(name: "Pavel Durov", photo: [
            "pavel",
            "pavel2",
            "pavel3",
            "pavel4"
        ], isFrom: "Russia, St. Petersburg"),
        User(name: "Donald Trump", photo: [
            "trump",
            "trump2",
            "trump3",
            "trump4"
        ], isFrom: "USA, Washington"),
        User(name: "No name", photo: nil)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVIew.dataSource = self
        tableVIew.delegate = self
        
        self.tableVIew.tableFooterView = UIView()
        
        // Регистрация ячейки
        tableVIew.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: friendsViewControllerIdentifier)
    }
    
}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Количество ячеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    // Создание ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: friendsViewControllerIdentifier, for: indexPath) as? TableViewCell
        else { return TableViewCell() }
        
        let friend = friends[indexPath.row]
        
        cell.configurate(name: friend.name, imgProfile: UIImage(named: friend.photo?[0] ?? "default"), description: friend.isFrom)
        
        return cell
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
            destination.friend = friends[indexPath.row]
        }
    }
    
}
