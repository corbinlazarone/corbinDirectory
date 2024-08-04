//
//  CustomButton.swift
//  corbinDirectory
//
//  Created by Corbin Lazarone on 8/3/24.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .padding()
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(8)
                .font(.headline)
        }
    }
}
