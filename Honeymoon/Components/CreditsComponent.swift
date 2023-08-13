//
//  CreditsComponent.swift
//  Honeymoon
//
//  Created by Matteo Buompastore on 13/08/23.
//

import SwiftUI

struct CreditsComponent: View {
    
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        VStack {
            HStack {
                Text("Photos")
                    .foregroundColor(.gray)
                Spacer()
                Text("Unsplash")
            } //: HSTACK
            
            Divider()
            
            Text("Photographers")
                .foregroundColor(.gray)
                .padding(.vertical, 6)
            
            Text("Shifaaz Shamoon (Maldives), Grillot Edouard (France), Evan Wise (Greece), Christoph Schulz (United Arab Emirates), Andrew Coelho (USA), Damiano Baschiera (Italy), Daniel Olah (Hungary), Andrzej Rusinowski (Poland), Lucas Miguel (Slovenia), Florencia Potter (Spain), Ian Simmonds (USA), Ian Keefe (Canada), Denys Nevozhai (Thailand), David Köhler (Italy), Andre Benz (USA), Alexandre Chambon (South Korea), Roberto Nickson (Mexico), Ajit Paul Abraham (UK), Jeremy Bishop (USA), Davi Costa (Brazil), Liam Pozz (Australia)")
                .multilineTextAlignment(.leading)
                .font(.footnote)
            
        } //: VSTACK
    }
}


//MARK: - PREVIEW
struct CreditsComponent_Previews: PreviewProvider {
    static var previews: some View {
        CreditsComponent()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
