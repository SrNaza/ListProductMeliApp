//
//  HomeWidgetSearch.swift
//  ListProductMeliApp
//
//  Created by Nazareth villalba on 21/05/22.
//

import ObjectMapper

class HomeWidgetSearch: NSObject, Mappable {
    var siteId: String = ""
    var query: String = ""
    var paging: WidgetPaging = WidgetPaging()
    var results: [WidgetResult] = []
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        siteId <- map["site_id"]
        query <- map["query"]
        paging <- map["paging"]
        results <- map["results"]
    }
}
