//
//  BaseControllerType.swift
//  ListProductMeliApp
//
//  Created by Nazareth villalba on 22/05/22.
//

import Foundation
import UIKit

public protocol BaseControllerType {
    var baseController: UIViewController { get }
}

public extension BaseControllerType {
    
    var navigationController: UINavigationController? {
        if let baseController = baseController as? UINavigationController {
            return baseController
        }
        
        if let navController = baseController.navigationController {
            return navController
        }
        
        return nil
    }
}
// todo nz posible guia RappiBrowserWireframe
