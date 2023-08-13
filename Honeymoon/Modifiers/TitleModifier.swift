//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by Matteo Buompastore on 13/08/23.
//

import SwiftUI

struct TitleModifier : ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.pink)
    }
    
}
