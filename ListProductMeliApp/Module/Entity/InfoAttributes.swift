//
//  InfoAttributes.swift
//  ListProductMeliApp
//
//  Created by Nazareth villalba on 21/05/22.
//

import ObjectMapper

struct InfoAttributes: Mappable {
    var name: String = ""
    var valueId: String = ""
    var valueName: String = ""
    var valueStruct: String = ""
    var attributeGroupId: String = ""
    var attributeGroupName: String = ""
    var source: String = ""
    var id: String = ""
    
    init() {}
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        valueId <- map["value_id"]
        valueName <- map["value_name"]
        valueStruct <- map["value_struct"]
        attributeGroupId <- map["attribute_group_id"]
        attributeGroupName <- map["attribute_group_name"]
        source <- map["source"]
        id <- map["id"]
    }
}
