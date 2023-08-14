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
    @GestureState private var dragState : DragState = .inactive
    @State private var lastCardIndex : Int = 1
    @State private var cardRemovalTransition : AnyTransition = .trailingBottom
    
    private let haptics = UINotificationFeedbackGenerator()
    
    //MARK: - DRAG GESTURE STATES
    private let dragAreaThreshold : CGFloat = 65
    
    enum DragState {
        case inactive
        case pressing
        case dragging(translation : CGSize)
        
        var translation : CGSize {
            switch self {
                
            case .inactive, .pressing:
                return .zero
            case .dragging(translation: let translation):
                return translation
            }
        }
        
        var isDragging : Bool {
            switch self {
            case .dragging: return true
            case .pressing, .inactive: return false
            }
        }
        
        var isPressing : Bool {
            switch self {
            case .pressing, .dragging: return true
            case .inactive: return false
            }
        }
        
    }
    
    //MARK: - CARD VIEWS
    @State var cardViews : [CardComponent] = {
        var views = [CardComponent]()
        // DISPLAYS ALL THE CARDS
        /*for index honeymoon in honeymoonData {
         views.append(CardComponent(honeymoon: honeymoon))
         }*/
        
        //DISPLAYS 2 CARDS AT A TIME
        for index in 0..<2 {
            views.append(CardComponent(honeymoon: honeymoonData[index]))
        }
        
        //return views.reversed()
        return views
    }()
    
    //MARK: - MOVE THE CARD
    func moveCards() {
        cardViews.removeFirst()
        lastCardIndex += 1
        let honeymoon = honeymoonData[lastCardIndex % honeymoonData.count]
        let newCardView = CardComponent(honeymoon: honeymoon)
        cardViews.append(newCardView)
    }
    
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
                .opacity(dragState.isDragging ? 0 : 1)
                .animation(.easeOut, value: dragState.isDragging)
            
            Spacer()
            
            //MARK: - CARDS
            ZStack {
                ForEach(cardViews) {cardView in
                    cardView
                        .zIndex(isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay(
                            ZStack {
                                //XMARK SYMBOL
                                Image(systemName: "x.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(dragState.translation.width < -dragAreaThreshold && isTopCard(cardView: cardView) ?  1 : 0)
                                
                                //HEART SYMBOL
                                Image(systemName: "heart.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(dragState.translation.width > dragAreaThreshold && isTopCard(cardView: cardView) ?  1 : 0)
                            }
                        )
                        .offset(x: isTopCard(cardView: cardView) ? dragState.translation.width : 0, y: isTopCard(cardView: cardView) ? dragState.translation.height : 0)
                        .scaleEffect((dragState.isDragging && isTopCard(cardView: cardView)) ? 0.85 : 1)
                        .rotationEffect(.degrees(isTopCard(cardView: cardView) ? dragState.translation.width / 12 : 0))
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120), value: dragState.isDragging)
                        .transition(cardRemovalTransition)
                        .gesture(LongPressGesture(minimumDuration: 0.01).sequenced(before: DragGesture()).updating($dragState, body: { value, state, transaction in
                            switch value {
                            case .first(true): state = .pressing
                            case .second(true, let drag): state = .dragging(translation: drag?.translation ?? .zero)
                            default: break
                            }
                        }).onChanged({value in
                            guard case .second(true, let drag?) = value else {
                                return
                            }
                            if drag.translation.width < -dragAreaThreshold {
                                cardRemovalTransition = .leadingBottom
                            }
                            if drag.translation.width > dragAreaThreshold {
                                cardRemovalTransition = .trailingBottom
                            }
                        }).onEnded({value in
                            guard case .second(true, let drag?) = value else {
                                return
                            }
                            if drag.translation.width < -dragAreaThreshold || drag.translation.width > dragAreaThreshold {
                                moveCards()
                                playSound(sound: "sound-rise", type: "mp3")
                                haptics.notificationOccurred(.success)
                            }
                            
                        })
                        )
                        
                }
            }
            .padding(.horizontal)
            //CardComponent(honeymoon: destinations[2]).padding()
            
            Spacer()
            
            //MARK: - FOOTER
            FooterView(showBookingAlert: $showBookingAlert)
                .opacity(dragState.isDragging ? 0 : 1)
                .animation(.easeOut, value: dragState.isDragging)
            
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
