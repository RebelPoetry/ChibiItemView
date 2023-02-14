//
//  ChibyItemView.swift
//  ViewFTR
//
//  Created by Kazakh on 14.02.2023.
//

import SwiftUI

// MARK: - ChibyItemView

public struct ChibyItemView: View {
    
    // MARK: - Properties
    
    /// Chiby item image name
    public let imageName: String
    
    /// Chiby item name
    public let title: String
    
    /// Indicate if view 'SOON' is needed
    public var isHaveBadge: Bool
    
    // MARK: - View
   
    public var body: some View {
        GeometryReader { proxy in
            ZStack {
                VStack{
                    Spacer()
                    Text(title)
                        .lineLimit(1)
                        .padding(LayoutConstants.titleEdgeInsets)
                        .font(.system(size: 17, weight: .medium))
                        .minimumScaleFactor(0.38)
                }
                Image(imageName)
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

// MARK: - LayoutConstants

private enum LayoutConstants {
    
    static let titleEdgeInsets: EdgeInsets = EdgeInsets(top: 0,leading: 6,bottom: 16,trailing: 6)
    static let badgeTitleHorizontalPadding: CGFloat = 2
    static let viewCornerRadius: CGFloat = 24
    static let badgeCornerRadius: CGFloat = 44
    static let imageScaleFactor: CGFloat = 1.7
    static let imageHorizontalPadding: CGFloat = 35
    static let cornerRadius: CGFloat = 24
    static let badgePadding: CGFloat = 12
}
