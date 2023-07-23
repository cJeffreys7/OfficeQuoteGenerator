//
//  Character.swift
//  OfficeQuoteGenerator
//
//  Created by Chris Jeffreys on 7/20/23.
//

import Foundation

struct Character: Decodable {
    let character: String
    let age: String
    let aliases: [String]
    let occupation: String
    let description: String
    let idStart: Int
    let idEnd: Int
}
