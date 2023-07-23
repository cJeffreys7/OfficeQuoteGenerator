//
//  Constants.swift
//  OfficeQuoteGenerator
//
//  Created by Chris Jeffreys on 7/20/23.
//

import Foundation
import SwiftUI

extension String {
    var removeSpaces: String {
        self.replacingOccurrences(of: " ", with: "")
    }
}

let characters: [Character] = {
    let decoder = JSONDecoder()
    
    let data = try! Data(contentsOf: Bundle.main.url(forResource: "characters", withExtension: "json")!)
    return try! decoder.decode([Character].self, from: data)
}()

func getRandomCharacter() -> String {
    return characters[Int.random(in: 0..<characters.count)].character
}

func getCharacterGuesses(correctCharacter: String, totalCharacters: Int) -> [String] {
    var characters: [String] = [correctCharacter]
    
    repeat {
        let randomCharacter = getRandomCharacter()
        if !characters.contains(randomCharacter) {
            characters.append(randomCharacter)
        }
    } while characters.count < totalCharacters
    
    return characters
}
