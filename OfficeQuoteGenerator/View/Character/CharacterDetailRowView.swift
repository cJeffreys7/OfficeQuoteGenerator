//
//  CharacterDetailRowView.swift
//  OfficeQuoteGenerator
//
//  Created by Chris Jeffreys on 7/20/23.
//

import SwiftUI

struct CharacterDetailRowView: View {
    // MARK: - PROPERTIES
    
    let label: String
    let content: String
    
    // MARK: - BODY
    
    var body: some View {
        HStack (alignment: .top, spacing: 6, content: {
            Text(label)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color("Primary"))
            
            Spacer()
            
            Text(content)
                .font(.body)
                .multilineTextAlignment(.trailing)
                .foregroundColor(Color("Primary"))
        }) //: HSTACK
    }
}

// MARK: - PREVIEW

struct CharacterDetailRowView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailRowView(label: "Occupation", content: "Assistant to the Regional Manager")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
