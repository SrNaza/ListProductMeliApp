//
//  InfoSellerAddress.swift
//  ListProductMeliApp
//
//  Created by Nazareth villalba on 21/05/22.
//

import ObjectMapper

struct InfoSellerAddress: Mappable {
    var city: InfoSellerCity = InfoSellerCity()
    
    init() {}
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        city <- map["city"]
    }
}

struct InfoSellerCity: Mappable {
    var id: String = ""
    var name: String = ""

    init() {}

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
}
