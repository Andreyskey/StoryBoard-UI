//
//  PhotosViewController.swift
//  VK-StoryBoard
//
//  Created by Андрей Волков on 31.08.2021.
//

import UIKit

class PhotosViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    // Надпись об отсутствии фотографий
    @IBOutlet weak var noPhoto: UILabel!
    
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
        
        if let _ = friend.photo?.count { noPhoto.isHidden = true }
        else { noPhoto.isHidden = false }
    }
    
}

extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Количество секций
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Количество ячеек
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friend.photo?.count ?? 0
    }
    
    // Создание ячейни
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photosViewControllerIdentifier, for: indexPath) as? CustomCollectionViewCell
        else { return CustomCollectionViewCell() }
    
        cell.configurate(image: UIImage(named: friend.photo?[indexPath.row] ?? "default"))
        
        cell.sizeThatFits(CGSize(width: 125, height: 125))
        
        return cell
    }
}
