//
//  Constans.swift
//  ListProductMeliApp
//
//  Created by Nazareth villalba on 22/05/22.
//

import UIKit

// MARK: - Fonts
enum FontTypes {
    case bold
    case light
    case medium
    case regular
    case semibold
    case thin
}

enum FontFamily {
    case Sans
    case Mono
}

func setFont(of type: FontTypes, family: FontFamily = .Sans, and size: CGFloat) -> UIFont {
    var fontName = ""
    
    switch family {
    case .Mono:
        fontName = "IBMPlexMono"
        break
    case .Sans:
        fontName = "IBMPlexSans"
        break
    }
    
    switch type {
    case .bold:
        fontName += "-Bold"
    case .light:
        fontName += "-Light"
    case .medium:
        fontName += "-Medium"
    case .regular:
        fontName += ""
    case .semibold:
        fontName += "-SemiBold"
    case .thin:
        fontName += "-Thin"
    }
    
    let font = UIFont(name: fontName, size: size)!
    return font
}

// MARK: - Images
struct Images {
    enum icons: String {
        case buttonContinue = "button.continue.active"
        case logout = "logout"
        case menu = "menu"
        case user = "user"
        case backWhite = "backWhite"
    }
    
    enum images: String {
        case login = "LOGIN"
        case meliDev = "meliDevelopers"
        case dev = "devPreview"
    }
    
    enum tabBarIcons: String {
        case home = "home"
        case favorites = "favorito"
    }
    
    static func icon(type: icons) -> UIImage? {
        return UIImage(named: "\(type.rawValue)")
    }
    
    static func image(type: images) -> UIImage? {
        return UIImage(named: "\(type.rawValue)")
    }
    
    static func tabBarIcon(type: tabBarIcons) -> UIImage? {
        return UIImage(named: "\(type.rawValue)")
    }
}
