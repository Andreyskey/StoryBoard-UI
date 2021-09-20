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
        
    
    var isLiked = false // Состояние лайка
    var likes = 0 // Количество
    
    func recognizerView() { // Наблюдатель нажатий
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(addLike)) // создание наблюдателя
        recognizer.numberOfTapsRequired = 1 // Количество нажатий для реагирования
        recognizer.numberOfTouchesRequired = 1 // Количество пальцев для реагирования
        likeView.addGestureRecognizer(recognizer) // Добавлять наблюдатель на вью
    }
    
    @objc func addLike() {
        if !isLiked {
            likes += 1 // Добавляем один лайк
            heartImg.image = UIImage(systemName: "heart.fill") // Меняем лайк на заполненное сердечко
            heartImg.tintColor = .red // Меняем цвет на красный
            likesCount.text = String(likes) // Изменяем количество лайков для отображения
            isLiked = true // Меняем позицию лайка
        } else {
            likes -= 1 // Убираем один лайк
            heartImg.image = UIImage(systemName: "heart") // Меняем обратно на пустое сердечко
            heartImg.tintColor = .systemGray2 // Меняем на цвет не активного лайка
            likesCount.text = String(likes) // Изменяем текст о количестве лайков
            isLiked = false // Меня позицию на не активированый лайк
        }
    }
    
    func setup() {
    }
    
    func clearCell() {
        photoGroup.image = nil
        nameGroup.text = nil
        descriptionPost.text = nil
        oneImageView.image = nil
    }
    
    func configurate(post: Post?) {
        
        guard let post = post else { return }
        
        photoGroup.image = post.group.photoProfile
        nameGroup.text = post.group.name
        descriptionPost.text = post.descriptionPost
        if post.imagePost.count > 0 {
            oneImageView.image = post.imagePost[0]
        } else {
            oneImageView.image = nil
        }
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
