//
//  ContentView.swift
//  OfficeQuoteGenerator
//
//  Created by Chris Jeffreys on 7/20/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @StateObject private var quoteViewModel = QuoteViewModel(controller: QuoteController())
    @State private var guessMode: Bool = false
    @State private var character: String = ""
    
    let buttonWidth: CGFloat = 240
    let buttonHeight: CGFloat = 60
    
    // MARK: - BODY
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                VStack (alignment: .center) {
                    VStack (alignment: .center, spacing: 4, content: {
                        switch quoteViewModel.status {
                        case .success(let data):
                            if (guessMode) {
                                CharacterGuessQuoteView(character: data.character, quote: data.quote)
                                    .padding()
                            } else {
                                NavigationLink(
                                    destination:
                                        CharacterView(character: characters.first(where: {$0.character == data.character}) ?? characters[0])) {
                                            CharacterQuoteView(character: data.character, quote: data.quote)
                                                .padding(.horizontal)
                                        }
                            }
                        case .fetching:
                            ProgressView()
                                .controlSize(.large)
                        default:
                            Image("officelogo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 360)
                                .cornerRadius(32)
                        } //: SWITCH
                    }) //: VSTACK
                    .frame(width: geo.size.width, height: geo.size.height / 1.5)
                    .padding(.bottom)

                    Button {
                        Task {
                            guessMode = false
                            await quoteViewModel.getRandomQuote()
                        }
                    } label: {
                        Text("Get Random Quote")
                            .font(
                                .custom("AmericanTypewriter", size: 24)
                            )
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Secondary"))
                            .frame(width: buttonWidth, height: buttonHeight)
                            .background(Color("Primary"))
                            .cornerRadius(12)
                    } //: BUTTON
                    Button {
                        Task {
                            guessMode = true
                            await quoteViewModel.getRandomQuoteNewCharacter(character: character)
                            character = quoteViewModel.character
                        }
                    } label: {
                        Text("Guess That Quote")
                            .font(
                                .custom("AmericanTypewriter", size: 24)
                            )
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Secondary"))
                            .frame(width: buttonWidth, height: buttonHeight)
                            .background(Color("Primary"))
                            .cornerRadius(12)
                    } //: BUTTON
                } //: VSTACK
                .navigationTitle("Quotes")
                .navigationBarHidden(true)
            } //: VSTACK
        } //: NAVIGATION
        .accentColor(Color("Primary"))
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 14 Pro")
    }
}
