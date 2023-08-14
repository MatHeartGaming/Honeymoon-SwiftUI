//
//  FooterView.swift
//  Honeymoon
//
//  Created by Matteo Buompastore on 12/08/23.
//

import SwiftUI

struct FooterView: View {
    
    //MARK: - PROPERTIES
    @Binding var showBookingAlert : Bool
    private let haptics = UINotificationFeedbackGenerator()
        
    //MARK: - BODY
    var body: some View {
        HStack {
            Image(systemName: "xmark.circle")
                .font(.system(size: 42, weight: .light))
            
            Spacer()
            
            Button {
                print("Success!")
                showBookingAlert.toggle()
                playSound(sound: "sound-click", type: "mp3")
                haptics.notificationOccurred(.success)
            } label: {
                Text("BOOK DESTINATION")
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .tint(.pink)
                    .background(
                        Capsule()
                            .stroke(.pink, lineWidth: 2)
                    )
            }

            
            Spacer()
            
            Image(systemName: "heart.circle")
                .font(.system(size: 42, weight: .light))
            
            
        } //: HSTACK
        .padding()
    }
}


//MARK: - PREVIEW
struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView(showBookingAlert: .constant(true))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
