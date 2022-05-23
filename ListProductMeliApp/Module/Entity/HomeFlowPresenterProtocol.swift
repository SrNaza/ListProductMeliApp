//
//  HomeFlowPresenterProtocol.swift
//  ListProductMeliApp
//
//  Created by Nazareth villalba on 21/05/22.
//

import RxSwift
import RxCocoa

protocol HomeFlowPresenterProtocol {
    func getItemsDetail(itemToSearch: String) -> Observable<HomeWidgetSearch>
    func notifyTransition(transition: HomeFlowTransation, completion: RPCompletionBlock?)
    func handleAction(_ action: HomePresenterAction)
}

enum HomePresenterAction {
    case showDetail(item: WidgetResult)
    case showList(item: [WidgetResult])
}
