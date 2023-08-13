//
//  ButtonModifiers.swift
//  Honeymoon
//
//  Created by Matteo Buompastore on 13/08/23.
//

import SwiftUI

struct ButtonModifier : ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .padding()
            .frame(minWidth: 100, maxWidth: .infinity)
            .background(Capsule().fill(.pink))
            .foregroundColor(.white)
    }
    
}
