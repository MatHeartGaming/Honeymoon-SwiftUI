//
//  CardTransition.swift
//  Honeymoon
//
//  Created by Matteo Buompastore on 14/08/23.
//

import SwiftUI

extension AnyTransition {
    
    static var trailingBottom : AnyTransition {
        AnyTransition.asymmetric(insertion: .identity, removal: .move(edge: .trailing).combined(with: .move(edge: .bottom)))
    }
    
    static var leadingBottom : AnyTransition {
        AnyTransition.asymmetric(insertion: .identity, removal: .move(edge: .leading).combined(with: .move(edge: .bottom)))
    }
    
}
