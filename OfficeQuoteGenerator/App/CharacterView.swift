//
//  CharacterView.swift
//  OfficeQuoteGenerator
//
//  Created by Chris Jeffreys on 7/20/23.
//

import SwiftUI

struct CharacterView: View {
    // MARK: - PROPERTIES
    
    let character: Character
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            VStack (spacing: 2) {
                CharacterCardView(character: character.character)
                    .padding(.bottom, 12)
                
                CharacterDetailRowView(label: "Age", content: character.age)
                CharacterDetailRowView(label: "Alias", content: character.aliases.randomElement()!)
                CharacterDetailRowView(label: "Occupation", content: character.occupation)
                ScrollView (showsIndicators: false) {
                    Text(character.description)
                        .padding(.vertical)
                        .foregroundColor(Color("Primary"))
                }
            } //: VSTACK
            .padding(.horizontal)
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        } //: VSTACK
        .padding(.top, 48)
        .ignoresSafeArea()
    }
}

// MARK: - PREVIEW

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(character: characters[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
