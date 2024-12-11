//
//  OverlayView.swift
//  App
//
//  Created by Ibrahim Mo Gedami on 12/11/24.
//

import SwiftUI

struct OverlayView: View {
    
    @EnvironmentObject var coordinator: NavigationCoordinator

    var body: some View {
        ZStack {
            // Background blur and dismiss action
            Color.black.opacity(0.5)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        coordinator.showOverlay = false
                    }
                }

            // Content of the overlay
            VStack(spacing: 20) {
                Text("Overlay Content")
                    .font(.title)
                    .foregroundColor(.white)

                Button("Dismiss") {
                    withAnimation {
                        coordinator.showOverlay = false
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 10)
        }
    }
}

