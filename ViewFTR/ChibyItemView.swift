//
//  ChibyItemView.swift
//  ViewFTR
//
//  Created by Kazakh on 14.02.2023.
//

import SwiftUI
import Foundation

// MARK: - ChibyItemView

public struct ChibyItemView: View {
    
    // MARK: - Properties
    
    /// Chiby item image name
    public let title: String
    
    /// Chiby item name
    public let itemLabel: String
    
    /// Indicate if view 'SOON' is needed
    public var isHaveBadge: Bool
    
    // MARK: - View
    
    /// View container with label, image and badge if it is needed
    public var body: some View {
        GeometryReader { proxy in
            ZStack {
                VStack{
                    Spacer()
                    Text(itemLabel)
                        .lineLimit(1)
                        .padding(.bottom, LayoutConstants.titleEdgeInsets.bottom)
                        .padding(.horizontal, LayoutConstants.titleEdgeInsets.trailing)
                        .font(.system(size: 17, weight: .medium))
                        .minimumScaleFactor(0.38)
                }
                Image(title)
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, LayoutConstants.imageHorizontalPadding)
                    .frame(height: proxy.size.width / LayoutConstants.imageScaleFactor)
            }
            .frame(height: proxy.size.width)
            .background(Color.white)
            .smoothCorners(radius: LayoutConstants.viewCornerRadius)
            .overlay(
                VStack {
                    HStack {
                        if isHaveBadge {
                            Spacer()
                            BadgeView {
                                Text("SOON")
                                    .lineLimit(1)
                                    .font(.system(size: 15, weight: .medium))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, LayoutConstants.badgeTitleHorizontalPadding)
                                
                            }
                            .smoothCorners(radius: LayoutConstants.badgeCornerRadius)
                        }
                    }
                    Spacer()
                }
                    .padding(LayoutConstants.badgePadding)
            )
        }
    }
}

// MARK: - SoonView

/// Badge view, for example 'soon' badge
public struct BadgeView<Content: View>: View {
    
    /// Content to show
    public let content: Content
    
    // MARK: - Initializer
    
    /// - Parameters:
    ///   - content: The content to which wiil aplly parameters below
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    public var body: some View {
        content
            .padding(LayoutConstants.badgeTitlePadding)
            .background(Color("soonColor"))
            .minimumScaleFactor(0.38)
    }
}

// MARK: - Useful

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

extension View {
    func smoothCorners(radius: CGFloat) -> some View {
        modifier(SmoothCorners(radius: radius))
    }
}

// MARK: - Layout

private enum LayoutConstants {
    
    static let titleEdgeInsets: EdgeInsets = EdgeInsets(top: 0,leading: 6,bottom: 16,trailing: 6)
    static let badgeTitlePadding: CGFloat = 4
    static let badgeTitleHorizontalPadding: CGFloat = 2
    static let viewCornerRadius: CGFloat = 24
    static let badgeCornerRadius: CGFloat = 44
    static let imageScaleFactor: CGFloat = 1.7
    static let imageHorizontalPadding: CGFloat = 35
    static let cornerRadius: CGFloat = 24
    static let badgePadding: CGFloat = 12
}

// MARK: - UIScreen

extension UIScreen {
    
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}
