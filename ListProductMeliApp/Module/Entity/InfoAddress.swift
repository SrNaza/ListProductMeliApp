//
//  InfoAddress.swift
//  ListProductMeliApp
//
//  Created by Nazareth villalba on 21/05/22.
//

import ObjectMapper

struct InfoAddress: Mappable {
    var stateId: String = ""
    var stateName: String = ""
    var cityId: String = ""
    var cityName: String = ""
    
    init() {}
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        stateId <- map["state_id"]
        stateName <- map["state_name"]
        cityId <- map["city_id"]
        cityName <- map["city_name"]
    }
}
