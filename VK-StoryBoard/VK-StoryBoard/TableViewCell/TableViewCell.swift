//
//  TableViewCell.swift
//  VK-StoryBoard
//
//  Created by Андрей Волков on 31.08.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var nameProfile: UILabel!
    
    // Создание ячейки
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        clearCell()
    }
    
    // Предустановки ячейки
    func setup() {
        
    }
    
    // Удаление ячейки
    func clearCell() {
        imageView?.image = nil
        nameProfile.text = nil
    }
    
    override func prepareForReuse() {
        clearCell()
    }
    
    // Конфигурация ячейки
    func configurate(name: String?, imgProfile: UIImage?) {
        if let profileName = name {
            nameProfile.text = profileName
        }
            
        imageProfile.image = imgProfile
    }
}
