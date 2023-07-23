//
//  CharacterGuessQuoteView.swift
//  OfficeQuoteGenerator
//
//  Created by Chris Jeffreys on 7/21/23.
//

import SwiftUI

struct CharacterGuessQuoteView: View {
    // MARK: - PROPERTIES

    @State private var guessCharacters: [String] = []
    @State private var guess: String? = nil
    
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
                if (guess != nil) {
                    Text(guess == character ? "Correct!" : "Try Again")
                        .font(
                            .custom("AmericanTypewriter", size: 32)
                        )
                        .fontWeight(.semibold)
                    NavigationLink(
                        destination:
                            CharacterView(character: characters.first(where: {$0.character == guess!}) ?? characters[0])) {
                                CharacterCardView(character: guess!)
                            }
                    //CharacterCardView(character: guess!)
                } else if (guessCharacters.count > 0) {
                    VStack {
                        Button(action: {
                            guess = guessCharacters[0]
                        }) {
                            CharacterCardView(character: guessCharacters[0])
                                .scaledToFit()
                        }
                        HStack {
                            Button(action: {
                                guess = guessCharacters[1]
                            }) {
                                CharacterCardView(character: guessCharacters[1])
                            }
                            Button(action: {
                                guess = guessCharacters[2]
                            }) {
                                CharacterCardView(character: guessCharacters[2])
                            }
                        }
                    }
                }
            }) //: VSTACK
            .onAppear(perform: {
                guess = nil
                guessCharacters = getCharacterGuesses(correctCharacter: character, totalCharacters: 3)
                guessCharacters.shuffle()
            })
            .onChange(of: character) { newCharacter in
                guess = nil
                guessCharacters = getCharacterGuesses(correctCharacter: newCharacter, totalCharacters: 3)
                guessCharacters.shuffle()
            }
        }
    }
}

struct CharacterGuessQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterGuessQuoteView(character: "Creed Bratton", quote: "Oh, you’re paying way too much for worms. Who’s your worm guy?")
    }
}
