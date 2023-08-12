//
//  CardsView.swift
//  Honeymoon
//
//  Created by Matteo Buompastore on 12/08/23.
//

import SwiftUI

struct CardsView: View {
    
    
    //MARK: - PROPERTIES
    private let destinations = honeymoonData
    
    //MARK: - BODY
    var body: some View {
        VStack {
            //MARK: - HEADER
            HeaderView()
            
            Spacer()
            
            //MARK: - CARDS
            CardComponent(honeymoon: destinations[2])
                .padding()
            
            Spacer()
            
            //MARK: - FOOTER
            FooterView()
        }
    }
}


//MARK: - PREVIEW
struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
            .previewLayout(.sizeThatFits)
            //.padding()
    }
}
