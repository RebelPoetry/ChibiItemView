//
//  View.swift
//  ViewFTR
//
//  Created by Kazakh on 14.02.2023.
//

import SwiftUI

// MARK: - View

extension View {
    public func smoothCorners(radius: CGFloat) -> some View {
        modifier(SmoothCorners(radius: radius))
    }
}

// MARK: - SmoothCorners

/// Modifier that apply smooth corner radius to  rectangle View
public struct SmoothCorners: ViewModifier {
    
    // MARK: - Properties
    
    /// The radius of corners
    public let radius: CGFloat
    
    // MARK: - ViewModifier
    
    public func body(content: Content) -> some View {
        content
            .clipShape(
                RoundedRectangle(
                    cornerRadius: radius,
                    style: .continuous
                )
            )
    }
}
