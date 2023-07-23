//
//  CharacterCardView.swift
//  OfficeQuoteGenerator
//
//  Created by Chris Jeffreys on 7/20/23.
//

import SwiftUI

struct CharacterCardView: View {
    // MARK: - PROPERTIES
    
    @State private var isAnimating: Bool = true
    
    let character: String
    let cardCornerRadius: CGFloat = 24
    let cardWidth: CGFloat = 380
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                Image("officebackground\(Int.random(in: 1...3))")
                    .resizable()
                    .cornerRadius(cardCornerRadius)
                
                Image(character.removeSpaces.lowercased())
                    .resizable()
                    .scaledToFit()
                    .offset(y: isAnimating ? 150 : 0)
                
                HStack {
                    Spacer()
                    Text(character)
                        .font(
                            .custom("AmericanTypewriter", size: 16)
                        )
                        .fontWeight(.semibold)
                    .padding(.vertical, 10)
                    Spacer()
                } //: HSTACK
                .background(.ultraThinMaterial)
                .foregroundColor(.white)
                .offset(y: isAnimating ? 40 : 0)
            } //: ZSTACK
            .frame(maxWidth: cardWidth, maxHeight: cardWidth)
            .mask {
                Rectangle()
                    .cornerRadius(cardCornerRadius)
            }
            .background(
                RoundedRectangle(cornerRadius: cardCornerRadius)
                    .stroke(.black.opacity(0.5), lineWidth: 4)
            )
            .onAppear(perform: {
                withAnimation(.easeOut(duration: 0.75)) {
                    isAnimating = false
                }
            })
            .shadow(color: .black.opacity(0.5), radius: 4, x: 2, y: 2)
        } //: VSTACK
    }
}

// MARK: - PREVIEW

struct CharacterCardView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCardView(character: "Jim Halpert")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
