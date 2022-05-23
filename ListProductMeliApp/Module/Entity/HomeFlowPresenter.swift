//
//  HomeFlowPresenter.swift
//  ListProductMeliApp
//
//  Created by Nazareth villalba on 21/05/22.
//

import UIKit
import RxSwift
import RxCocoa

// MARK: - Home Module Presentable Implementation
public typealias RPCompletionBlock = () -> Void

class HomeFlowPresenter {
    // MARK: - Properties
    private let interactor: HomeFlowInteractor
    private let router: HomeFlowRouter
    private let disposeBag = DisposeBag()
    

    // MARK: - Life Cycle
    required init(interactor: HomeFlowInteractor, router: HomeFlowRouter) {
        self.interactor = interactor
        self.router = router
    }
}

extension HomeFlowPresenter: HomeFlowPresenterProtocol {
    
    func notifyTransition(transition: HomeFlowTransation, completion: RPCompletionBlock? = nil) {
        router.performTransition(transition: transition, onCompletion: completion)
    }
    
    func getItemsDetail(itemToSearch: String) -> Observable<HomeWidgetSearch> {
        return interactor.getItemsOrderDetail(itemToSearch: itemToSearch)
            .asObservable()
    }
    
    func handleAction(_ action: HomePresenterAction) {
        switch action {
        case .showDetail(let item):
            router.performTransition(transition: .showItemsSearchDetail(item: item), onCompletion: nil)
        case .showList(let itemList):
            router.performTransition(transition: .showItemsCollection(infoResult: itemList, presenter: self), onCompletion: nil)
        }
    }
}
