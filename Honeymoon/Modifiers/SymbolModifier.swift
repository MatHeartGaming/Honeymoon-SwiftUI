//
//  SymbolModifier.swift
//  Honeymoon
//
//  Created by Matteo Buompastore on 14/08/23.
//

import SwiftUI

struct SymbolModifier : ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 128))
            .shadow(color: .black.opacity(0.2), radius: 12)
    }
    
}
