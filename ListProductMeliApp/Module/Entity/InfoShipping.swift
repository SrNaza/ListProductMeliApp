//
//  InfoShipping.swift
//  ListProductMeliApp
//
//  Created by Nazareth villalba on 21/05/22.
//

import ObjectMapper

struct InfoShipping: Mappable {
    var freeShipping: Bool = false
    var mode: String = ""
    var tags: [Any] = []
    var logisticType: String = ""
    var storePickUp: Bool = false
    
    init() {}
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        freeShipping <- map["free_shipping"]
        mode <- map["mode"]
        tags <- map["tags"]
        logisticType <- map["logistic_type"]
        storePickUp <- map["store_pick_up"]
    }
}
