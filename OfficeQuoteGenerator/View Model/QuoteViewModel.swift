//
//  QuoteViewModel.swift
//  OfficeQuoteGenerator
//
//  Created by Chris Jeffreys on 7/20/23.
//

import Foundation

@MainActor
class QuoteViewModel: ObservableObject {
    enum Status {
        case notStarted
        case fetching
        case success(data: Quote)
        case failed(error: Error)
    }
    
    @Published private(set) var status: Status = .notStarted
    var character: String = ""
    
    private let controller: QuoteController
    
    init(controller: QuoteController) {
        self.controller = controller
    }
    
    func getRandomQuote() async {
        status = .fetching
        
        do {
            let quote = try await controller.getRandomQuote()
            
            status = .success(data: quote)
        } catch {
            status = .failed(error: error)
        }
    }
    
    func getRandomQuoteNewCharacter(character: String) async {
        status = .fetching
        
        do {
            let quote = try await controller.getRandomQuoteNewCharacter(character: character)
            status = .success(data: quote)
            self.character = quote.character
        } catch {
            status = .failed(error: error)
        }
    }
}
