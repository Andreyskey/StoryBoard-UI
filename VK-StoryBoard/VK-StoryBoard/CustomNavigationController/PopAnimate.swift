//
//  PopAnimate.swift
//  VK-StoryBoard
//
//  Created by Андрей Волков on 04.10.2021.
//

import UIKit

class PopAnimate: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2 // Время анимации
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from), // Контроллер от которого происходит переход
              let destination = transitionContext.viewController(forKey: .to) // Контроллер к которуму идет переход
        else { return }
        
        let containerViewFrame = transitionContext.containerView.frame // Экран где проиходит анимация (контейнер)
        
        let sourceViewFrame = CGRect( // Место где окажется началный контроллер после анимации
                     x: containerViewFrame.width,
                     y: 0,
                     width: source.view.frame.height,
                     height: source.view.frame.width
                 )
        
        transitionContext.containerView.addSubview(destination.view) // Добавить на экран контроллер-цель
        
        let destinationViewFrame = source.view.frame // Размеры и позиция контроллера цели после анимации
        
        destination.view.transform = CGAffineTransform(rotationAngle: .pi / 2) // Поворот контроллер-цели на 90 градусов
        
        destination.view.frame = CGRect( // Размеры и позиция котроллера-цели перед анимацией
                    x: -containerViewFrame.height,
                    y: 0,
                    width: source.view.frame.height,
                    height: source.view.frame.width
                )
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext) / 2,
                       animations: {
                            source.view.transform = CGAffineTransform(rotationAngle: -(.pi/2)) // Поворот view на 90 градусов
                            source.view.frame = sourceViewFrame // Установка размеров и позиции
                             
                            destination.view.transform = .identity // Возвращение контроллера-цели на место
                            destination.view.frame = destinationViewFrame // Установка размеров и позиции
                        }) { isFinishedSuccessfully in
                            if isFinishedSuccessfully {
                                transitionContext.completeTransition(isFinishedSuccessfully)
                            }
                        }
    }
}
