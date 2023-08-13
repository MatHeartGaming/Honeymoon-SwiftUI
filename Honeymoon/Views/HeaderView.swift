//
//  Headerview.swift
//  Honeymoon
//
//  Created by Matteo Buompastore on 12/08/23.
//

import SwiftUI

struct HeaderView: View {
    
    //MARK: - PROPERTIES
    @Binding var showGuideView : Bool
    @Binding var showInfoView : Bool
    
    //MARK: - BODY
    var body: some View {
        HStack {
            Button {
                print("Info")
                showInfoView.toggle()
            } label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .tint(.primary)
            .sheet(isPresented: $showInfoView) {
                InfoView()
            }
            
            Spacer()
            
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            
            Spacer()
            
            Button {
                print("Guide")
                showGuideView.toggle()
            } label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .tint(.primary)
            .sheet(isPresented: $showGuideView) {
                GuideView()
            }
            
        } //: HSTACK
        .padding()
    }
}

//MARK: - PREVIEW
struct Headerview_Previews: PreviewProvider {
    
    @State static var showGuideView = false
    @State static var showInfoView = false
    
    static var previews: some View {
        HeaderView(showGuideView: $showGuideView, showInfoView: $showInfoView)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
