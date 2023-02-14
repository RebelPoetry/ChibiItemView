//
//  View.swift
//  ViewFTR
//
//  Created by Kazakh on 14.02.2023.
//

import Foundation
import SwiftUI

// MARK: - View

extension View {
    func smoothCorners(radius: CGFloat) -> some View {
        modifier(SmoothCorners(radius: radius))
    }
}

// MARK: - SmoothCorners

/// Modifier that apply smooth corner radius to  rectangle View
///
///  - Parameters:
///  - radius: The radius of corners
struct SmoothCorners: ViewModifier {
    let radius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .clipShape(
                RoundedRectangle(
                    cornerRadius: radius,
                    style: .continuous
                )
            )
    }
}
