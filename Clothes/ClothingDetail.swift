//
//  ClothingDetail.swift
//  Clothes
//
//  Created by Garrett Johnson on 12/6/20.
//

import SwiftUI

struct ClothingDetail: View {
    let color1: Color = Color(red: 0.5, green: 0.5, blue: 1, opacity: 0.6)
    let color2: Color = Color(red: 0, green: 0.8, blue: 1, opacity: 0.9)
    
    // Passed in from HomeView
    @Binding var showDetail: Bool
    @Binding var clothingType: String
    
    // Button Colors
    @State private var primaryColorButton: Color = Color.blue
    @State private var secondaryColorButton: Color = Color.blue
    @State private var patternButton: Color = Color.blue
    @State private var textureButton: Color = Color.blue
    @State private var fitButton: Color = Color.blue
    @State private var formalityButton: Color = Color.blue
    
    // Button Text Colors
    @State private var primaryColorButtonText: Color = Color.white
    @State private var secondaryColorButtonText: Color = Color.white
    
    // Picker Text
    @State private var primaryColorText: String = "Primary Color"
    @State private var secondaryColorText: String = "Secondary Color"
    @State private var patternText: String = "Pattern"
    @State private var textureText: String = "Texture"
    @State private var fitText: String = "Fit"
    @State private var formalityText: String = "Formality"
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: UnitPoint(x: 0.9, y: 0.9), endPoint: UnitPoint(x: 0.25, y: 0.25))
                .ignoresSafeArea()
            VStack {
                ClothingIcon(clothingType: $clothingType)
                HStack {
                    PrimaryColorMenu(
                        primaryColorButton: $primaryColorButton,
                        primaryColorText: $primaryColorText,
                        primaryColorButtonText: $primaryColorButtonText
                    )
                    SecondaryColorMenu(
                        secondaryColorButton: $secondaryColorButton,
                        secondaryColorText: $secondaryColorText,
                        secondaryColorButtonText: $secondaryColorButtonText
                    )
                }
                HStack {
                    PatternMenu(
                        patternButton: $patternButton,
                        patternText: $patternText
                    )
                    TextureMenu(
                        textureButton: $textureButton,
                        textureText: $textureText
                    )
                }
                HStack {
                    FitMenu(
                        fitButton: $fitButton,
                        fitText: $fitText
                    )
                    FormalityMenu(
                        formalityButton: $formalityButton,
                        formalityText: $formalityText
                    )
                }
                Button(action: {
                    clothes.append(
                        Clothing(
                            id: Int.random(in: 1..<10000),
                            primaryColor: primaryColorText,
                            secondaryColor: secondaryColorText,
                            pattern: patternText,
                            texture: textureText,
                            fit: fitText,
                            formality: formalityText,
                            type: self.clothingType
                        )
                    )
                    self.showDetail = false
                }) {
                    SubmitButton()
                }
            }
        }
    }
}


struct ClothingDetail_Previews: PreviewProvider {
    static var previews: some View {
        ClothingDetail(showDetail: .constant(false), clothingType: .constant(""))
    }
}

struct ClothingIcon: View {
    @Binding var clothingType: String
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

struct SubmitButton: View {
    var body: some View {
        Text("Add")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 200, height: 50)
            .background(Color.green)
            .cornerRadius(15.0)
            .padding(40)
    }
}

struct PrimaryColorMenu: View {
    @Binding var primaryColorButton: Color
    @Binding var primaryColorText: String
    @Binding var primaryColorButtonText: Color
    var body: some View {
        Menu {
            Button("Red", action: {
                self.primaryColorButton = Color.red
                self.primaryColorText = "Red"
                self.primaryColorButtonText = Color.white
            })
            Button("Green", action: {
                self.primaryColorButton = Color.green
                self.primaryColorText = "Green"
                self.primaryColorButtonText = Color.white
            })
            Button("Blue", action: {
                self.primaryColorButton = Color.blue
                self.primaryColorText = "Blue"
                self.primaryColorButtonText = Color.white
            })
            Button("Yellow", action: {
                self.primaryColorButton = Color.yellow
                self.primaryColorText = "Yellow"
                self.primaryColorButtonText = Color.black
            })
            Button("White", action: {
                self.primaryColorButton = Color.white
                self.primaryColorText = "White"
                self.primaryColorButtonText = Color.black
            })
            Button("Black", action: {
                self.primaryColorButton = Color.black
                self.primaryColorText = "Black"
                self.primaryColorButtonText = Color.white
            })
            Button("Orange", action: {
                self.primaryColorButton = Color.orange
                self.primaryColorText = "Orange"
                self.primaryColorButtonText = Color.black
            })
        } label: {
            Text(primaryColorText)
                .fontWeight(.semibold)
                .foregroundColor(primaryColorButtonText)
                .frame(width: 150, height: 30)
                .padding(10)
                .background(primaryColorButton)
                .cornerRadius(10)
        }
        .padding()
    }
}

struct SecondaryColorMenu: View {
    @Binding var secondaryColorButton: Color
    @Binding var secondaryColorText: String
    @Binding var secondaryColorButtonText: Color
    var body: some View {
        Menu {
            Button("Red", action: {
                self.secondaryColorButton = Color.red
                self.secondaryColorText = "Red"
                self.secondaryColorButtonText = Color.white
            })
            Button("Green", action: {
                self.secondaryColorButton = Color.green
                self.secondaryColorText = "Green"
                self.secondaryColorButtonText = Color.white
            })
            Button("Blue", action: {
                self.secondaryColorButton = Color.blue
                self.secondaryColorText = "Blue"
                self.secondaryColorButtonText = Color.white
            })
            Button("Yellow", action: {
                self.secondaryColorButton = Color.yellow
                self.secondaryColorText = "Yellow"
                self.secondaryColorButtonText = Color.black
            })
            Button("White", action: {
                self.secondaryColorButton = Color.white
                self.secondaryColorText = "White"
                self.secondaryColorButtonText = Color.black
            })
            Button("Black", action: {
                self.secondaryColorButton = Color.black
                self.secondaryColorText = "Black"
                self.secondaryColorButtonText = Color.white
            })
            Button("Orange", action: {
                self.secondaryColorButton = Color.orange
                self.secondaryColorText = "Orange"
                self.secondaryColorButtonText = Color.black
            })
        } label: {
            Text(secondaryColorText)
                .fontWeight(.semibold)
                .foregroundColor(secondaryColorButtonText)
                .frame(width: 150, height: 30)
                .padding(10)
                .background(secondaryColorButton)
                .cornerRadius(10)
        }
        .padding()
    }
}

struct PatternMenu: View {
    @Binding var patternButton: Color
    @Binding var patternText: String
    var body: some View {
        Menu {
            Button("None", action: {
                self.patternButton = Color.gray
                self.patternText = "None"
            })
            Button("Striped", action: {
                self.patternButton = Color.gray
                self.patternText = "Striped"
            })
            Button("Plaid", action: {
                self.patternButton = Color.gray
                self.patternText = "Plaid"
            })
            Button("Other", action: {
                self.patternButton = Color.gray
                self.patternText = "Other"
            })
        } label: {
            Text(patternText)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 150, height: 30)
                .padding(10)
                .background(patternButton)
                .cornerRadius(10)
        }
        .padding()
    }
}

struct TextureMenu: View {
    @Binding var textureButton: Color
    @Binding var textureText: String
    var body: some View {
        Menu {
            Button("None", action: {
                self.textureButton = Color.gray
                self.textureText = "None"
            })
            Button("Waffle", action: {
                self.textureButton = Color.gray
                self.textureText = "Waffle"
            })
            Button("Fuzzy", action: {
                self.textureButton = Color.gray
                self.textureText = "Fuzzy"
            })
            Button("Coarse", action: {
                self.textureButton = Color.gray
                self.textureText = "Coarse"
            })
        } label: {
            Text(textureText)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 150, height: 30)
                .padding(10)
                .background(textureButton)
                .cornerRadius(10)
            
        }
        .padding()
    }
}

struct FitMenu: View {
    @Binding var fitButton: Color
    @Binding var fitText: String
    var body: some View {
        Menu {
            Button("Slim", action: {
                self.fitButton = Color.gray
                self.fitText = "Slim"
            })
            Button("Tight", action: {
                self.fitButton = Color.gray
                self.fitText = "Tight"
            })
            Button("Loose", action: {
                self.fitButton = Color.gray
                self.fitText = "Loose"
            })
            Button("Baggy", action: {
                self.fitButton = Color.gray
                self.fitText = "Baggy"
            })
        } label: {
            Text(fitText)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 150, height: 30)
                .padding(10)
                .background(fitButton)
                .cornerRadius(10)
        }
        .padding()
    }
}

struct FormalityMenu: View {
    @Binding var formalityButton: Color
    @Binding var formalityText: String
    var body: some View {
        Menu {
            Button("Workout", action: {
                self.formalityButton = Color.gray
                self.formalityText = "Workout"
            })
            Button("Casual", action: {
                self.formalityButton = Color.gray
                self.formalityText = "Casual"
            })
            Button("Semi-Formal", action: {
                self.formalityButton = Color.gray
                self.formalityText = "Semi-Formal"
            })
            Button("Formal", action: {
                self.formalityButton = Color.gray
                self.formalityText = "Formal"
            })
        } label: {
            Text(formalityText)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 150, height: 30)
                .padding(10)
                .background(formalityButton)
                .cornerRadius(10)
        }
        .padding()
    }
}
