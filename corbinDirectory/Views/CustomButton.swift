//
//  CustomButton.swift
//  corbinDirectory
//
//  Created by Corbin Lazarone on 8/3/24.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let gradient: LinearGradient?
    let color: Color?
    let action: () -> Void
    let borderColor: Color?
    let borderWidth: CGFloat?

    init(title: String, gradient: LinearGradient? = nil, color: Color? = nil, borderColor: Color? = nil, borderWidth: CGFloat? = nil, action: @escaping () -> Void) {
        self.title = title
        self.gradient = gradient
        self.color = color
        self.action = action
        self.borderColor = borderColor
        self.borderWidth = borderWidth
    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .padding()
                .background(gradient != nil ? AnyView(gradient) : AnyView(color ?? Color.clear))
                .foregroundColor(.white)
                .cornerRadius(8)
                .font(.headline)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(borderColor ?? Color.clear, lineWidth: borderWidth ?? 0)
                )
        }
    }
}
