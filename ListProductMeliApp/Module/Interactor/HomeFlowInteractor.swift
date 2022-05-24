//
//  HomeFlowInteractor.swift
//  ListProductMeliApp
//
//  Created by Nazareth villalba on 21/05/22.
//

import RxSwift
import RxCocoa
import Alamofire
import AlamofireObjectMapper


// MARK: - Home Interactive Implementation
class HomeFlowInteractor {

    // MARK: - Life Cycle
    init() {}
    
    func getItemsOrderDetail(itemToSearch: String) -> Single<HomeWidgetSearch> {
        
        let url = Api().anotherFunction(sitesdId: .mco, itemToSearch: itemToSearch)
        return Single<HomeWidgetSearch>.create { single in
            AF.request(url).responseObject { (response: DataResponse<HomeWidgetSearch, AFError>) in
                switch response.result {
                case .success(let result):
                    return single(.success(result))
                case .failure(let error):
                    print(error.errorDescription ?? "")
                    break
                }
            }
            return Disposables.create()
        }
    }
}
