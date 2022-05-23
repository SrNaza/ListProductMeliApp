//
//  WidgetResult.swift
//  ListProductMeliApp
//
//  Created by Nazareth villalba on 21/05/22.
//

import ObjectMapper

struct WidgetResult: Mappable {
    var id: String = ""
    var siteId: String = ""
    var title: String = ""
    var seller: String = ""
    var price: Int = 0
    var currencyId: String = ""
    var availableQuantity: Int = 0
    var soldQuantity: Int = 0
    var buyingMode: String = ""
    var listingTypeId: String = ""
    var stopTime: String = ""
    var condition: String = ""
    var permalink: String = ""
    var thumbnail: String = ""
    var acceptsMercadopago: Bool = false
    var installments: InfoInstallments = InfoInstallments()
    var address: InfoAddress = InfoAddress()
    var shipping: InfoShipping = InfoShipping()
    var sellerAddress: InfoSellerAddress = InfoSellerAddress()
    var attributes: InfoAttributes = InfoAttributes()
    var originalPrice: String = ""
    var categoryId: String = ""
    var officialStoreId: Int = 0
    var catalogProductId: String = ""
    var tags: [String] = []
    var catalogListing: Bool = false
    
    init() {}
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id <- map["total"]
        siteId <- map["site_id"]
        title <- map["title"]
        seller <- map["seller"]
        price <- map["price"]
        currencyId <- map["currency_id"]
        availableQuantity <- map["available_quantity"]
        soldQuantity <- map["sold_quantity"]
        buyingMode <- map["buying_mode"]
        listingTypeId <- map["listing_type_id"]
        stopTime <- map["stop_time"]
        condition <- map["condition"]
        permalink <- map["permalink"]
        thumbnail <- map["thumbnail"]
        acceptsMercadopago <- map["accepts_mercadopago"]
        installments <- map["installments"]
        address <- map["address"]
        shipping <- map["shipping"]
        sellerAddress <- map["seller_address"]
        attributes <- map["attributes"]
        originalPrice <- map["original_price"]
        categoryId <- map["category_id"]
        officialStoreId <- map["official_store_id"]
        catalogProductId <- map["catalog_product_id"]
        tags <- map["tags"]
        catalogListing <- map["catalog_listing"]
    }
}
