//
//  PhotosViewController.swift
//  VK-StoryBoard
//
//  Created by Андрей Волков on 31.08.2021.
//

import UIKit

class PhotosViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    // Идентификатор контроллера
    var photosViewControllerIdentifier = "photosViewControllerIdentifier"
    
    // Переменная для передачи данных о друге пользователя
    var friend: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Регситрация ячейки
        collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: photosViewControllerIdentifier)
    }
    
}

extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Количество ячеек
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    // Создание ячейни
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photosViewControllerIdentifier, for: indexPath) as? CustomCollectionViewCell
        else { return CustomCollectionViewCell() }
    
        cell.configurate(image: UIImage(named: friend.photo ?? "default"))
        
        return cell
    }
    
    
}
