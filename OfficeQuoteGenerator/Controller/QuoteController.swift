//
//  QuoteController.swift
//  OfficeQuoteGenerator
//
//  Created by Chris Jeffreys on 7/20/23.
//

import Foundation

struct QuoteController {
    enum NetworkError: Error {
        case badResponse
    }
    
    private let baseURL = URL(string: "https://officeapi.akashrajpurohit.com")
    
    func getRandomQuote() async throws -> Quote {
        let quoteURL = baseURL?.appending(path: "quote/random")
        
        let (data, response) = try await URLSession.shared.data(from: quoteURL!)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        let quote = try JSONDecoder().decode(Quote.self, from: data)
        return quote
    }
    
    func getRandomQuoteNewCharacter(character: String) async throws -> Quote {
        let newCharacters = characters.filter( { $0.character != character } )
        let randomNewCharacter = newCharacters.randomElement()
        let newQuoteId = Int.random(in: randomNewCharacter!.idStart...randomNewCharacter!.idEnd)
        let quoteURL = baseURL?.appending(path: "quote/\(newQuoteId)")
        
        let (data, response) = try await URLSession.shared.data(from: quoteURL!)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        let quote = try JSONDecoder().decode(Quote.self, from: data)
        return quote
    }
}
