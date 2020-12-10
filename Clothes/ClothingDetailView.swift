//
//  ClothingDetailView.swift
//  Clothes
//
//  Created by Garrett Johnson on 12/9/20.
//

import SwiftUI

struct ClothingDetailView: View {
    let color1: Color = Color(red: 0.5, green: 0.5, blue: 1, opacity: 0.6)
    let color2: Color = Color(red: 0, green: 0.8, blue: 1, opacity: 0.9)
    
    var clothing: Clothing
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: UnitPoint(x: 0.9, y: 0.9), endPoint: UnitPoint(x: 0.25, y: 0.25))
                .ignoresSafeArea()
            VStack {
                ClothingIdentifierImage(clothingType: clothing.type)
                HStack {
                    ClothesIdentifierPrimaryColor(attribute: clothing.primaryColor)
                    ClothesIdentifierPrimaryColor(attribute: clothing.secondaryColor)
                }
                HStack {
                    ClothesIdentifierPrimaryColor(attribute: clothing.pattern)
                    ClothesIdentifierPrimaryColor(attribute: clothing.texture)
                }
                HStack {
                    ClothesIdentifierPrimaryColor(attribute: clothing.fit)
                    ClothesIdentifierPrimaryColor(attribute: clothing.formality)
                }
            }
        }
    }
}

struct ClothingIdentifierImage: View {
    var clothingType: String
    var body: some View {
        Image(clothingType)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
            .clipShape(Rectangle())
            .shadow(radius: 5)
            .padding()
    }
}

struct ClothesIdentifierPrimaryColor: View {
    var attribute: String
    var body: some View {
        Text(attribute)
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 150, height: 55)
            .background(Color.blue)
            .cornerRadius(15.0)
            .padding()
    }
}


struct ClothingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ClothingDetailView(clothing: clothes[0])
    }
}
