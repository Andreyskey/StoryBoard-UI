//
//  TableViewCell.swift
//  VK-StoryBoard
//
//  Created by Андрей Волков on 31.08.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // Вью с фотографей внутри
    @IBOutlet weak var customView: UIView!
    
    // Фото и имя друга
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var nameProfile: UILabel!
    
    // Описание
    @IBOutlet weak var descrip: UILabel!
    
    // Добавляем возможность кастомизации через Interface Builder
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0)
    @IBInspectable var shadowRadius: CGFloat = 0
    @IBInspectable var opacity: CGFloat = 0.5
    
    // Создание ячейки
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        clearCell()
    }
    
    // Предустановки ячейки
    func setup() {
        customView.layer.shadowOffset = shadowOffset // Сдвиг тени относительно Вью
        customView.layer.shadowRadius = shadowRadius // Радиос тени
        customView.layer.shadowOpacity = Float(opacity) // Прозрачность тени
    }
    
    // Удаление данных с ячейки
    func clearCell() {
        imageView?.image = nil
        nameProfile.text = nil
    }
    
    // Подготовка для переиспользования ячейки
    override func prepareForReuse() {
        clearCell()
    }
    
    // Конфигурация ячейки
    func configurate(name: String?, imgProfile: UIImage?, description: String?) {
        if let profileName = name {
            nameProfile.text = profileName
        }
         
        descrip.text = description ?? ""
        
        imageProfile.image = imgProfile
    }
}
