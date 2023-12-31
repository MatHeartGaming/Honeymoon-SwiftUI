//
//  GuideView.swift
//  Honeymoon
//
//  Created by Matteo Buompastore on 13/08/23.
//

import SwiftUI

struct GuideView: View {
    
    //MARK: - PROPERTIES
    @Environment(\.presentationMode) private var presentation
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                
                HeaderComponent()
                
                Spacer(minLength: 10)
                
                Text("Get Started")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                Text("Discover and pick the perfect destination for your romantic Honeymoon!")
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 10)
                
                VStack(alignment: .leading, spacing: 25) {
                    GuideComponent(title: "Like",
                                   subititle: "Swipe right",
                                   description: "Do you like this destination? Touch the screen and swipe right. It will be saved to your favourites.",
                                   icon: "heart.circle")
                    
                    GuideComponent(title: "Dismiss",
                                   subititle: "Swipe left",
                                   description: "Would you rather skip this place? Touch the screen and swipe left. You will no longer see it.",
                                   icon: "xmark.circle")
                    
                    GuideComponent(title: "Book",
                                   subititle: "Tap the button",
                                   description: "Our selection of honeymoon resorts is the perfect setting for you to emabrk your new life together.",
                                   icon: "checkmark.square")
                } //: VSTACK GUIDE
                
                Spacer(minLength: 10)
                
                Button {
                    presentation.wrappedValue.dismiss()
                } label: {
                    Text("Continue".uppercased())
                        .modifier(ButtonModifier())
                } //: BUTTON

                
            } //: VSTACK
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        } //: SCROLL
    }
}


//MARK: - PREVIEW
struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
            .previewLayout(.sizeThatFits)
            //.padding()
    }
}
