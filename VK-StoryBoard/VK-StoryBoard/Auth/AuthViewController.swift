//
//  ViewController.swift
//  VK-StoryBoard
//
//  Created by Андрей Волков on 30.08.2021.
//

import UIKit

class AuthViewController: UIViewController {

    @IBOutlet weak var login: UITextField! // Аутлет логина
    @IBOutlet weak var password: UITextField! // Аутдет пароля
    @IBOutlet weak var scrollView: UIScrollView! // Аутлет ScrollView
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Отступ для текста внутри TextField
        login.indent(size: 10)
        password.indent(size: 10)
        
        // Цвет рамок TextField
        login.layer.borderColor = #colorLiteral(red: 1, green: 0.3200579286, blue: 0.335835427, alpha: 1)
        password.layer.borderColor = #colorLiteral(red: 1, green: 0.3200579286, blue: 0.335835427, alpha: 1)
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture) // Добавляем размер клавиатуры в  констрейнт скроллвью
    }
    
    // Метод проверки пароля и логина
    @IBAction func signIn(_ sender: Any) {
        if login.text == "admin" && password.text == "admin" {
            login.layer.borderWidth = 0
            password.layer.borderWidth = 0
            performSegue(withIdentifier: "succesLoginAndPassword", sender: nil)
        } else {
            // Если данные введены не верно, то появляется красная рамка
            login.layer.borderWidth = 1
            password.layer.borderWidth = 1
        }
    }
    
    @IBAction func exit(segue: UIStoryboardSegue) {
        login.text = nil
        password.text = nil
    }
    
    
// MARK: - Клавиатура
    
    @objc func keyboardWasShown(notification: Notification) {
        
        let info = notification.userInfo! as NSDictionary
        let keyboardSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)

        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets

    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        
            let contentInsets = UIEdgeInsets.zero
            scrollView?.contentInset = contentInsets
        
        }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
            
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
        }
    
    @objc func hideKeyboard() {
            self.scrollView?.endEditing(true)
        }
    
}

// MARK: - Отступы для TextField

// Скопированый код из интернета для изменения отступа

extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}

