//
//  Pet.swift
//  Sepia Pets
//
//  Created by Sanoop PM on 30/11/22.
//

import Foundation

struct PetList: Decodable {
    var pets:  [Pet]
    
}

struct Pet: Decodable {
    var imageUrl: String?
    var title: String?
    var contentUrl: String?
    var dateAdded: String?
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
        case contentUrl = "content_url"
        case dateAdded = "date_added"
        
        case title
      }
}
