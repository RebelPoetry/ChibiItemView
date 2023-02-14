//
//  BadgeView.swift
//  ViewFTR
//
//  Created by Kazakh on 14.02.2023.
//

import SwiftUI

// MARK: - BadgeView

/// Badge view, for example 'soon' badge
public struct BadgeView<Content: View>: View {
    
    // MARK: - Properties
    
    /// Content to show
    public let content: Content
    
    // MARK: - Initializer
    
    /// - Parameters:
    ///   - content: The content to which wiil aplly parameters below
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    // MARK: - View
    
    public var body: some View {
        content
            .padding(LayoutConstants.badgeTitlePadding)
            .background(Color("soonColor"))
            .minimumScaleFactor(0.38)
    }
}

// MARK: - LayoutConstants

private enum LayoutConstants {
    static let badgeTitlePadding: CGFloat = 4
}
