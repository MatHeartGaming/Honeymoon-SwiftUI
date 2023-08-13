//
//  RowAppInfoView.swift
//  Honeymoon
//
//  Created by Matteo Buompastore on 13/08/23.
//

import SwiftUI

struct RowAppInfoView: View {
    
    //MARK: - PROPERTIES
    var itemOne : String
    var itemTwo : String
    
    //MARK: - BODY
    var body: some View {
        VStack {
            HStack {
                Text(itemOne)
                    .foregroundColor(.gray)
                Spacer()
                Text(itemTwo)
            } //: HSTACK
            
            Divider()
            
        } //: VSTACK
    }
}

//MARK: - PREVIEW
struct RowAppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        RowAppInfoView(itemOne: "Application", itemTwo: "Honeymoon")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
