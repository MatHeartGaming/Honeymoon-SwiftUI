//
//  CardsView.swift
//  Honeymoon
//
//  Created by Matteo Buompastore on 12/08/23.
//

import SwiftUI

struct CardsView: View {
    
    
    //MARK: - PROPERTIES
    @State private var showBookingAlert = false
    @State private var showGuideView = false
    @State private var showInfoView = false
    private let destinations = honeymoonData
    
    //MARK: - CARD VIEWS
    var cardViews : [CardComponent] = {
        var views = [CardComponent]()
        // DISPLAYS ALL THE CARDS
        /*for index honeymoon in honeymoonData {
            views.append(CardComponent(honeymoon: honeymoon))
        }*/
        
        //DISPLAYS 2 CARDS AT A TIME
        for index in 0..<2 {
            views.append(CardComponent(honeymoon: honeymoonData[index]))
        }
        
        return views.reversed()
    }()
    
    //MARK: - TOP CARD
    private func isTopCard(cardView : CardComponent) -> Bool {
        guard let index = cardViews.firstIndex(where: {$0.id == cardView.id}) else {
            return false
        }
        return index == 0
    }
 
    //MARK: - BODY
    var body: some View {
        VStack {
            //MARK: - HEADER
            HeaderView(showGuideView: $showGuideView, showInfoView: $showInfoView)
            
            Spacer()
            
            //MARK: - CARDS
            ZStack {
                ForEach(cardViews) {cardView in
                    cardView
                }
            }
            .padding(.horizontal)
            //CardComponent(honeymoon: destinations[2]).padding()
            
            Spacer()
            
            //MARK: - FOOTER
            FooterView(showBookingAlert: $showBookingAlert)
        } //: VSTACK
        .alert("SUCCESS", isPresented: $showBookingAlert) {
            Button {
                showBookingAlert = false
            } label: {
                Text("Happy Honeymoon!")
            }

        } message: {
            Text("Wishing a lovely and most precious of the times together for the amazing couple.")
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
