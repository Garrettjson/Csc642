//
//  OutfitView.swift
//  Clothes
//
//  Created by Garrett Johnson on 12/9/20.
//

import SwiftUI

struct OutfitView: View {
    let color1: Color = Color(red: 0.5, green: 0.5, blue: 1, opacity: 0.6)
    let color2: Color = Color(red: 0, green: 0.8, blue: 1, opacity: 0.9)
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: UnitPoint(x: 0.9, y: 0.9), endPoint: UnitPoint(x: 0.25, y: 0.25))
                .ignoresSafeArea()
            VStack {
                List(filterClothes(clothes: clothes)) { clothing in
                        NavigationLink(destination: ClothingDetailView(clothing: clothing)) {
                            OutfitViewRow(clothing: clothing)
                    }
                }
            }
        }
    }
}

struct OutfitView_Previews: PreviewProvider {
    static var previews: some View {
        OutfitView()
    }
}
