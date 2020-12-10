//
//  OutfitViewRow.swift
//  Clothes
//
//  Created by Garrett Johnson on 12/9/20.
//

import SwiftUI

struct OutfitViewRow: View {
    var clothing: Clothing
    
    var body: some View {
        HStack {
            clothing.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(clothing.type)
            
            Spacer()
        }
    }
}

struct OutfitViewRow_Previews: PreviewProvider {
    static var previews: some View {
        OutfitViewRow(clothing: clothes[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
