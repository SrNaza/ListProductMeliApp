//
//  HomeFlowRouter.swift
//  ListProductMeliApp
//
//  Created by Nazareth villalba on 21/05/22.
//

import UIKit
import RxSwift
import RxCocoa


enum HomeFlowTransation {
    case showItemsSearchDetail(item: WidgetResult)
    case showItemsCollection(infoResult: [WidgetResult], presenter: HomeFlowPresenterProtocol)
}

// MARK: - Home Interactive Implementation
class HomeFlowRouter {

    // MARK: - Life Cycle
    private weak var baseController: UIViewController?
    private weak var shareModalController: UIViewController?

    init(baseController: UIViewController) {
        self.baseController = baseController
    }
    
    func performTransition(transition: HomeFlowTransation, onCompletion completion: RPCompletionBlock?) {
        switch transition {
        case .showItemsSearchDetail(let item):
            showItemsSearchDetail(item: item)
        case .showItemsCollection(let infoResult, let presenter):
            showItemsCollection(infoResult: infoResult, presenter: presenter)
        }
    }
}

extension HomeFlowRouter {
    func showItemsSearchDetail(item: WidgetResult) {
        let viewController = DetailViewController(result: item)
        baseController?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showItemsCollection(infoResult: [WidgetResult], presenter: HomeFlowPresenterProtocol) {
        let viewController = ListViewController(result: infoResult, presenter: presenter)
        baseController?.navigationController?.pushViewController(viewController, animated: true)
    }
}
