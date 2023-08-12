//
//  SplashScreen.swift
//  Honeymoon
//
//  Created by Matteo Buompastore on 12/08/23.
//

import SwiftUI

struct SplashScreen: View {
    
    //MARK: - PROPERTIES
    @State private var animateLogo = false
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .frame(width: screenWidth, height: screenHeight)
            
            Image("logo-honeymoon-app")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 200, maxWidth: 450, minHeight: 200, maxHeight: 450)
                .padding(24)
                .scaleEffect(animateLogo ? 1 : 0.9)
                .opacity(animateLogo ? 1 : 0.6)
                .animation(.spring(response: 0.8, dampingFraction: 1.5, blendDuration: 2).repeatForever(), value: animateLogo)
        } //: ZSTACK
        .ignoresSafeArea()
        .onAppear {
            animateLogo = true
        }
    }
}


//MARK: - PREVIEW
struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
