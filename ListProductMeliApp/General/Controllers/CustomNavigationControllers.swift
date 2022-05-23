//
//  CustomNavigationControllers.swift
//  ListProductMeliApp
//
//  Created by Nazareth villalba on 22/05/22.
//

import UIKit

class CustomNavigationControllers: UINavigationController {
    var isNavigationBarTransparent: Bool? {
        willSet {
            guard let newValue = newValue else { return }
            
            if newValue {
                navigationBar.setBackgroundImage(UIImage(), for: .default)
                navigationBar.shadowImage = UIImage()
                navigationBar.isTranslucent = true
                view.backgroundColor = .clear
            } else {
                navigationBar.setBackgroundImage(UIImage(), for: .default)
                navigationBar.shadowImage = UIImage()
                navigationBar.isTranslucent = false
                navigationBar.backgroundColor = .clear
            }
        }
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        isNavigationBarTransparent = true
        navigationBar.barStyle = .default
    }
    
    func setTitleColor(color: UIColor) {
        navigationBar.titleTextAttributes = [
            .foregroundColor: color,
            .font: setFont(of: .medium, and: 15)
        ]
    }
    
    private func setupTitleFont() {
        navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: setFont(of: .medium, and: 15)
        ]
    }
    
    func goToVC(vc: UIViewController) {
        let currentVC = viewControllers[viewControllers.count - 1]
        if !(vc.isKind(of: type(of: currentVC))) {
            for viewCtrl in viewControllers {
                if viewCtrl.isKind(of: type(of: vc)) {
                    popToViewController(viewCtrl, animated: true)
                    return
                }
            }
            pushViewController(vc, animated: true)
        }
    }
}
