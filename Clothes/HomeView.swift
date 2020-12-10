//
//  HomeView.swift
//  Clothes
//
//  Created by Garrett Johnson on 12/6/20.
//

import SwiftUI

struct HomeView: View {
    let color1: Color = Color(red: 0.5, green: 0.5, blue: 1, opacity: 0.6)
    let color2: Color = Color(red: 0, green: 0.8, blue: 1, opacity: 0.9)
    
    @State var showOutfit: Bool = false
    @State var showDetail: Bool = false
    @State var clothingType: String = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: UnitPoint(x: 0.9, y: 0.9), endPoint: UnitPoint(x: 0.25, y: 0.25))
                .ignoresSafeArea()
            VStack {
                HomeInstructionsText()
                HStack {
                    NavigationLink(destination: ClothingDetail(showDetail: self.$showDetail, clothingType: self.$clothingType),
                                   isActive: $showDetail) { EmptyView() }
                    Button(action: {self.showDetail = true; self.clothingType = "tShirt"}, label: {
                        AddTShirt()
                    })
                    
                    NavigationLink(destination: ClothingDetail(showDetail: self.$showDetail, clothingType: self.$clothingType),
                                   isActive: $showDetail) { EmptyView() }
                    Button(action: {self.showDetail = true; self.clothingType = "shirt"}, label: {
                        AddShirt()
                    })
                }
                HStack {
                    NavigationLink(destination: ClothingDetail(showDetail: self.$showDetail, clothingType: self.$clothingType),
                                   isActive: $showDetail) { EmptyView() }
                    Button(action: {self.showDetail = true; self.clothingType = "shorts"}, label: {
                        AddShorts()
                    })
                    
                    NavigationLink(destination: ClothingDetail(showDetail: self.$showDetail, clothingType: self.$clothingType),
                                   isActive: $showDetail) { EmptyView() }
                    Button(action: {self.showDetail = true; self.clothingType = "pants"}, label: {
                        AddPants()
                    })
                }
                HStack {
                    NavigationLink(destination: ClothingDetail(showDetail: self.$showDetail, clothingType: self.$clothingType),
                                   isActive: $showDetail) { EmptyView() }
                    Button(action: {self.showDetail = true; self.clothingType = "jacket"}, label: {
                        AddJacket()
                    })
                    
                    NavigationLink(destination: ClothingDetail(showDetail: self.$showDetail, clothingType: self.$clothingType),
                                   isActive: $showDetail) { EmptyView() }
                    Button(action: {self.showDetail = true; self.clothingType = "socks"}, label: {
                        AddSocks()
                    })
                }
                HStack {
                    NavigationLink(destination: OutfitView(),
                                   isActive: $showOutfit) { EmptyView() }
                    Button(action: {self.showOutfit = true}, label: {
                        ShowOutfit()
                    })
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct HomeInstructionsText: View {
    var body: some View {
        Text("Select a Category!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 35)
    }
}

struct AddTShirt: View {
    var body: some View {
        Image("tShirt")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            .clipShape(Rectangle())
            .shadow(radius: 5)
            .padding()
    }
}

struct AddShirt: View {
    var body: some View {
        Image("shirt")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            .clipShape(Rectangle())
            .shadow(radius: 5)
            .padding()
    }
}

struct AddShorts: View {
    var body: some View {
        Image("shorts")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            .clipShape(Rectangle())
            .shadow(radius: 5)
            .padding()
    }
}

struct AddJacket: View {
    var body: some View {
        Image("jacket")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            .clipShape(Rectangle())
            .shadow(radius: 5)
            .padding()
    }
}

struct AddPants: View {
    var body: some View {
        Image("pants")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            .clipShape(Rectangle())
            .shadow(radius: 5)
            .padding()
    }
}

struct AddSocks: View {
    var body: some View {
        Image("socks")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            .clipShape(Rectangle())
            .shadow(radius: 5)
            .padding()
    }
}

struct ShowOutfit: View {
    var body: some View {
        Text("Generate Outfit")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.green)
            .cornerRadius(15.0)
            .padding(30)
    }
}

