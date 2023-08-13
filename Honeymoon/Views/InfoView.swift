//
//  InfoView.swift
//  Honeymoon
//
//  Created by Matteo Buompastore on 13/08/23.
//

import SwiftUI

struct InfoView: View {
    
    //MARK: - PROPERTIES
    @Environment(\.presentationMode) private var presentation
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                
                Spacer(minLength: 10)
                
                Text("App Info")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                AppInfoView()
                
                Text("Credits")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                CreditsComponent()
                
                Spacer(minLength: 10)
                
                Button {
                    presentation.wrappedValue.dismiss()
                } label: {
                    Text("Continue".uppercased())
                        .modifier(ButtonModifier())
                }

                
            } //: VSTACK
            .frame(maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        } //: SCROLL
    }
}



struct AppInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RowAppInfoView(itemOne: "Application", itemTwo: "Honeymoon")
            RowAppInfoView(itemOne: "Compatibility", itemTwo: "iOS, iPadOS")
            RowAppInfoView(itemOne: "Developer", itemTwo: "MatBuompy")
            RowAppInfoView(itemOne: "Designer", itemTwo: "MatBuompy")
            RowAppInfoView(itemOne: "Website", itemTwo: "swiftuimasterclass.com")
            RowAppInfoView(itemOne: "Version", itemTwo: "1.0.0")
        }
    }
}

//MARK: - PREVIEW
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
