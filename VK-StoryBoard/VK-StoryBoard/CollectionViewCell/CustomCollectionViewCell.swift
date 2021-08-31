//
//  CustomCollectionViewCell.swift
//  VK-StoryBoard
//
//  Created by Андрей Волков on 31.08.2021.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photo: UIImageView!
    
    // Предуствноки ячейки
    func setup() {
        
    }
    
    // Очищение ячейки
    func clearCell() {
        photo.image = nil
    }
    
    override func prepareForReuse() {
        clearCell()
    }
    
    // Конфигурация ячейки
    func configurate(image: UIImage?) {
        if let img = image {
            photo.image = img
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        clearCell()
    }

}
