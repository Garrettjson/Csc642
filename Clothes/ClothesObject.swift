//
//  ClothesObject.swift
//  Clothes
//
//  Created by Garrett Johnson on 12/7/20.
//

import Foundation
import SwiftUI



struct Clothing: Hashable, Codable, Identifiable {
    var id: Int
    var primaryColor: String
    var secondaryColor: String
    var pattern: String
    var texture: String
    var fit: String
    var formality: String
    
    var type: String
    var image: Image {
        Image(type)
    }
}

var clothes = [Clothing]()

func filterClothes(clothes: Array<Clothing>) -> Array<Clothing> {
    var newClothes = [Clothing]()
    var bottomsCount: Int = 0
    var topsCount: Int = 0
    var outerwearCount: Int = 0
    var socksCount: Int = 0
    
    for clothing in clothes {
        if (clothing.type == "tShirt" || clothing.type == "shirt") && topsCount == 0 {
            newClothes.append(clothing)
            topsCount += 1
        }
        else if (clothing.type == "shorts" || clothing.type == "pants") && bottomsCount == 0 {
            newClothes.append(clothing)
            bottomsCount += 1
        }
        else if (clothing.type == "jacket") && outerwearCount == 0 {
            newClothes.append(clothing)
            outerwearCount += 1
        }
        else if (clothing.type == "socks") && socksCount == 0 {
            newClothes.append(clothing)
            socksCount += 1
        }
    }
    
    
    return newClothes
}
