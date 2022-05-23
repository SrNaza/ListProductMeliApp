//
//  InfoInstallments.swift
//  ListProductMeliApp
//
//  Created by Nazareth villalba on 21/05/22.
//

import ObjectMapper

struct InfoInstallments: Mappable {
    var quantity: Int = 0
    // todo nz verificar si estos dos mejor float
    var amount: Int = 0
    var rate: Int = 0
    var currencyId: String = ""
    
    init() {}
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        quantity <- map["quantity"]
        amount <- map["amount"]
        rate <- map["rate"]
        currencyId <- map["currency_id"]
    }
}
