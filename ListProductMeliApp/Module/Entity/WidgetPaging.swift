//
//  WidgetPaging.swift
//  ListProductMeliApp
//
//  Created by Nazareth villalba on 21/05/22.
//

import ObjectMapper

struct WidgetPaging: Mappable {
    var total: Int = 0
    var offset: Int = 0
    var limit: Int = 0
    var primatyResults: Int = 0
    
    init() {}
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        total <- map["total"]
        offset <- map["offset"]
        limit <- map["limit"]
        primatyResults <- map["primary_results"]
    }
}
