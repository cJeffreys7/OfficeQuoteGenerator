//
//  CharacterQuoteView.swift
//  OfficeQuoteGenerator
//
//  Created by Chris Jeffreys on 7/21/23.
//

import SwiftUI

struct CharacterQuoteView: View {
    // MARK: - PROPERTIES

    let character: String
    let quote: String
    
    // MARK: - BODY
    
    var body: some View {
        GeometryReader { geo in
            VStack (content: {
                ScrollView (showsIndicators: false) {
                    Text(quote)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Primary"))
                        .multilineTextAlignment(.center)
                        .padding()
                } //: SCROLLVIEW
                .frame(height: geo.size.height / 4)
                
                CharacterCardView(character: character)
            }) //: VSTACK
        }
    }
}

// MARK: - PREVIEW

struct CharacterQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        //CharacterQuoteView(character: "Michael Scott", quote: "It just seems awfully mean. But sometimes, the ends justify the mean.")
        CharacterQuoteView(character: "Dwight Schrute", quote: "What is my perfect crime? I break into Tiffany’s at midnight. Do I go for the vault? No, I go for the chandelier. It’s priceless. As I’m taking it down, a woman catches me. She tells me to stop. It’s her father’s business. She’s Tiffany. I say no. We make love all night. In the morning, the cops come, and I escape in one of their uniforms. I tell her to meet me in Mexico, but I go to Canada. I don’t trust her. Besides, I like the cold. Thirty years later, I get a postcard. I have a son, and he’s the chief of police. This is where the story gets interesting. I tell Tiffany to meet me in Paris by the Trocadero. She’s been waiting for me all these years. She’s never taken another lover. I don’t care. I don’t show up. I go to Berlin. That’s where I stashed the chandelier.")
    }
}
