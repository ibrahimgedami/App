//
//  HomeView.swift
//  App
//
//  Created by Ibrahim Mo Gedami on 12/7/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var coordinator: NavigationCoordinator

    var body: some View {
        VStack {
            Text("Home Screen")
                .font(.largeTitle)
            Button("Go to Details") {
                coordinator.push(AppScreen.details("Hello from Home!"))
            }
            .padding()

            Button("Go to Settings") {
                coordinator.push(AppScreen.settings)
            }
            .padding()
        }
        .navigationTitle("Home")
    }
}

struct DetailsView: View {
    @EnvironmentObject var coordinator: NavigationCoordinator
    let message: String

    var body: some View {
        VStack {
            Text("Details Screen")
                .font(.largeTitle)
            Text(message)
                .padding()
            Button("Back to Home") {
                coordinator.popToRoot()
            }
        }
        .navigationTitle("Details")
    }
}

struct SettingsView: View {
    @EnvironmentObject var coordinator: NavigationCoordinator

    var body: some View {
        VStack {
            Text("Settings Screen")
                .font(.largeTitle)
            Button("Back") {
                coordinator.pop()
            }
        }
        .navigationTitle("Settings")
    }
}

