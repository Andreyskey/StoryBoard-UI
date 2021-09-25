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
        recognizerImageView()
        clearCell()
    }
    
    // Наблюдаетль нажатий
    func recognizerImageView() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(animateImageProfile))
        recognizer.numberOfTouchesRequired = 1
        recognizer.numberOfTapsRequired = 1
        customView.addGestureRecognizer(recognizer)
    }
    
    // Objective-C функция для наблюдателя
    @objc func animateImageProfile() {
        var bounds = self.imageProfile.bounds
        bounds.size.width = 44 // Меняем высоту
        bounds.size.height = 44 // Меняем ширину
        
        // Запуск анимации
        UIView.animate(withDuration: 0.25, // Время анимации
                       delay: 0, // Задержка
                       animations: { [weak self] in // Сами анимации
                        self?.imageProfile.layer.bounds = bounds // Добавляем в анимацию
                        self?.imageProfile.layer.cornerRadius = 22 // Подстравиваем радиус
                       },
                       completion: { _ in
                        // Анимация с пружинным эффектом
                        UIView.animate(withDuration: 3, // Время анимации
                                       delay: 0, // Задержка
                                       usingSpringWithDamping: 0.1, // Сила пружины
                                       initialSpringVelocity: 0,
                                       options: [], // Опции анмиации
                                       animations: { [weak self] in
                                        self?.imageProfile.layer.bounds = CGRect(x: 0, y: 0, width: 48, height: 48) // Возвращаем стандартные значения
                                        self?.imageProfile.layer.cornerRadius  = 24 // Подстраиваем радиус
                                       } )
                        
                       })
    }
    
    // Предустановки ячейки
    func setup() {
        customView.layer.shadowOffset = shadowOffset // Сдвиг тени относительно Вью
        customView.layer.shadowRadius = shadowRadius // Радиос тени
        customView.layer.shadowOpacity = Float(opacity) // Прозрачность тени5
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
    func configurate(fullName: String?, imgProfile: UIImage?, description: String?) {
        if let profileName = fullName {
            nameProfile.text = profileName
        }
         
        descrip.text = description
        
        imageProfile.image = imgProfile ?? UIImage(named: "default")
    }
}
