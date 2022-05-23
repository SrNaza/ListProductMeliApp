//
//  NetworkingServices.swift
//  ListProductMeliApp
//
//  Created by Nazareth villalba on 21/05/22.
//

import ObjectMapper

let baseURL = "https://api.mercadolibre.com/sites"

enum sitesId: String {
    case mla = "MLA"
    case mco = "MCO"
    case mar = "MAR"
}

class ApiError : NSObject, Mappable {
    
    var message: String!
    
    required init?(map: Map) { }
    
    override init() { }
    
    func mapping(map: Map) {
        self.message <- map["message"]
    }
}

public class Api {
    
    required init() {}
    
    func anotherFunction(sitesdId: sitesId, itemToSearch: String) -> String {
        var path: String = ""
        
        if let validText = itemToSearch.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "!*'();:@&=+$,/?%#[]{} ").inverted){
            path = "\(baseURL)/\(sitesdId.rawValue)/search?q=\(validText)"
        } else {
            path = "\(baseURL)/\(sitesdId.rawValue)/search?q=\(itemToSearch)"
        }
        
        return path
    }
}

