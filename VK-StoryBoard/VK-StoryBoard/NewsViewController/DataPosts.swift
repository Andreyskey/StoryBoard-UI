//
//  DataPosts.swift
//  VK-StoryBoard
//
//  Created by Андрей Волков on 23.09.2021.
//

import UIKit

var posts = [
    Post(group: Group(name: "Наука и техника",
                      photoProfile: UIImage(named: "scince"),
                      topicGroup: "Наука"),
         descriptionPost: "Павел Дуров создал Telegram",
         imagePost: #imageLiteral(resourceName: "pavel4"),
         isLiked: false,
         likes: 0),
    Post(group: Group(name: "Wylsacom",
                      photoProfile: UIImage(named: "wylsa"),
                      topicGroup: "IT"),
         descriptionPost: "Айфоны очень крутые, андроиду еще далеко до них",
         imagePost: nil,
         isLiked: false,
         likes: 0),
    Post(group: Group(name: "MediaZone",
                      photoProfile: UIImage(named: "media"),
                      topicGroup: "СМИ"),
         descriptionPost: "День рождения Павла Дурова",
         imagePost: nil,
         isLiked: false,
         likes: 0),
    Post(group: Group(name: "OZON Маркетплэйс",
                      photoProfile: UIImage(named: "ozon"),
                      topicGroup: "Торговля"),
         descriptionPost: "Яндекс стал нашим официальным партнером",
         imagePost: #imageLiteral(resourceName: "yandex"),
         isLiked: false,
         likes: 0),
    Post(group: Group(name: "Космос просто",
                      photoProfile: UIImage(named: "space"),
                      topicGroup: "Наука"),
         descriptionPost: "Тим Кук и Илон Маск договорились о создании общего проекта по освоению марса",
         imagePost: nil,
         isLiked: false,
         likes: 0),
    Post(group: Group(name: "Apple",
                      photoProfile: UIImage(named: "apple"),
                      topicGroup: "Компания"),
         descriptionPost: "Apple поздравялет Павла дурова с Днем рождения",
         imagePost: #imageLiteral(resourceName: "apple"),
         isLiked: false,
         likes: 0),
    
]
