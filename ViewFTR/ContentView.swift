//
//  ContentView.swift
//  ViewFTR
//
//  Created by Kazakh on 13.02.2023.
//

import SwiftUI

// MARK: - ContentView

struct ContentView: View {
    var body: some View {
        VStack{
            Spacer()
            HStack(spacing: 16) {
                ChibyItemView(title: "radar", itemLabel: "Радар", isHaveBadge: true)
                ChibyItemView(title: "pack", itemLabel: "Мой инвентарь", isHaveBadge: true)
            }
            .padding(16)
            Spacer()
        }
        .background(Color.gray)
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
