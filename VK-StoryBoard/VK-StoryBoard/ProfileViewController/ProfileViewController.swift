//
//  ProfileViewController.swift
//  VK-StoryBoard
//
//  Created by Андрей Волков on 02.09.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var statusProfile: UILabel!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var photoProfile: UIImageView!
    @IBOutlet weak var date: UILabel!
    
    var me = User(name: "Волков Андрей", photo: ["myPhoto"], date: "12 сентября 1999")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoProfile.layer.borderWidth = 1
        photoProfile.layer.borderColor = UIColor.gray.cgColor
        fullName.text = me.name
        date.text = me.date
        photoProfile.image = UIImage(named: me.photo?[0] ?? "default")
    }
}
