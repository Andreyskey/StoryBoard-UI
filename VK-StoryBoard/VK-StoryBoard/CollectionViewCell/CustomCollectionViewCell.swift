//
//  CustomCollectionViewCell.swift
//  VK-StoryBoard
//
//  Created by Андрей Волков on 31.08.2021.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var heartImg: UIImageView!
    @IBOutlet weak var likeCount: UILabel!
    
    var isLiked = false
    var likes = 0
    
    func recoginzer() {
        let recoginzer = UITapGestureRecognizer(target: self, action: #selector(addLike))
        recoginzer.numberOfTapsRequired = 2 // Два раза нажать для срабаывания лайка
        recoginzer.numberOfTouchesRequired = 1 // Нужен один палец
        view.addGestureRecognizer(recoginzer)
    }
    
    @objc func addLike() {
        if !isLiked {
            likes += 1
            isLiked = true
            heartImg.image = UIImage(systemName: "heart.fill")
            heartImg.tintColor = .red
            likeCount.text = String(likes)
        } else {
            likes -= 1
            isLiked = false
            heartImg.image = UIImage(systemName: "heart")
            heartImg.tintColor = .systemGray2
            likeCount.text = String(likes)
        }
    }
    
    // Предуствноки ячейки
    func setup() {
        
    }
    
    // Очищение ячейки
    func clearCell() {
        photo.image = nil
    }
    
    // Подготовка к переиспользованию ячейки
    override func prepareForReuse() {
        clearCell()
    }
    
    // Конфигурация ячейки
    func configurate(image: UIImage?) {
        if let img = image {
            photo.image = img
        }
    }
    
    // Создание ячейки
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        recoginzer()
        clearCell()
    }

}
