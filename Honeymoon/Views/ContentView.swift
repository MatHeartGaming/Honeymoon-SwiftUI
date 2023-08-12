//
//  ContentView.swift
//  Honeymoon
//
//  Created by Matteo Buompastore on 12/08/23.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - PROPERTIES
    @State private var showSplashScreen = true
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            if !showSplashScreen {
                CardsView()
            } else {
                SplashScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation(.easeOut) {
                                showSplashScreen = false
                            }
                        }
                    } //: SPLASHSCREEN
            }
        } //: ZSTACK
    }
}


//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
