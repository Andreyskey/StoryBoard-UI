//
//  NewsTableViewCell.swift
//  VK-StoryBoard
//
//  Created by Андрей Волков on 03.09.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    // В общем сам пост
    @IBOutlet weak var photoGroup: UIImageView! // Аватар группы
    @IBOutlet weak var nameGroup: UILabel! // Название группы
    @IBOutlet weak var descriptionPost: UILabel! // Текст поста
    
    // Четыре UIImageView для отображения картинок поста
    @IBOutlet weak var oneImageView: UIImageView!
    
    // View лайка
    @IBOutlet weak var likeView: UIView! // Вью для считывания нажатия
    @IBOutlet weak var heartImg: UIImageView! // Картинка сердечка
    @IBOutlet weak var likesCount: UILabel! // Количесво лайков
    
    
    func recognizerView() { // Наблюдатель нажатий
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(addLike)) // создание наблюдателя
        recognizer.numberOfTapsRequired = 1 // Количество нажатий для реагирования
        recognizer.numberOfTouchesRequired = 1 // Количество пальцев для реагирования
        likeView.addGestureRecognizer(recognizer) // Добавлять наблюдатель на вью
    }
    
    var indexPathRow: Int?
    
    // Функция нажатия лайка
    @objc func addLike() {
        
        guard let indexPathRowCell = indexPathRow else { return }
        
        if !posts[indexPathRowCell].isLiked {
            posts[indexPathRowCell].likes += 1 // Добавляем лайк
            likesCount.text = String(posts[indexPathRowCell].likes) // Добавляем в Label
            posts[indexPathRowCell].isLiked = true
            
            // Меняем лайк на заполненное сердечко с анимацией
            UIView.transition(with: heartImg,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: { [weak self] in
                                self?.heartImg.image = UIImage(systemName: "heart.fill") // Заполненное сердечко
                                self?.heartImg.tintColor = .red  // Меняем цвет на красный
                              })
        } else {
            posts[indexPathRowCell].likes -= 1 // Добавляем лайк
            likesCount.text = String(posts[indexPathRowCell].likes) // Добавляем в Label
            posts[indexPathRowCell].isLiked = false
            
            // Меняем обратно на пустое сердечко с анимацией
            UIView.transition(with: heartImg,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: { [weak self] in
                                self?.heartImg.image = UIImage(systemName: "heart") // Пустое сердечко
                                self?.heartImg.tintColor = .systemGray2 // Меняем на цвет не активного лайка
                              })
        }
    }
    
    // Предустанока настроек ячейки
    func setup() {
        
        guard let indexPathRowCell = indexPathRow else { return } // Проверка есть ли индекс ячейки
        
        if posts[indexPathRowCell].isLiked {
            heartImg.image = UIImage(systemName: "heart.fill")
            heartImg.tintColor = .red
        }
    }
    
    // Очистка ячейки полностью
    func clearCell() {
        photoGroup.image = nil
        nameGroup.text = nil
        descriptionPost.text = nil
        oneImageView.image = nil
        heartImg.image = UIImage(systemName: "heart")
        heartImg.tintColor = .systemGray2
    }
    
    func configurate(post: Post?, indexPath: Int) {
        
        // Проверяем наличие поста
        guard let post = post else { return }
        
        photoGroup.image = post.group.photoProfile // Устанавливаем фото группы
        nameGroup.text = post.group.name // Устанавливаем название группы
        descriptionPost.text = post.descriptionPost // Описание поста
        oneImageView.image = post.imagePost // Фото поста
        likesCount.text = String(post.likes) // Предустановка лайков
        
        indexPathRow = indexPath // Индекс ячейки
        
        setup()
    }
    
    override func prepareForReuse() {
        clearCell()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        recognizerView()
        clearCell()
    }
}
