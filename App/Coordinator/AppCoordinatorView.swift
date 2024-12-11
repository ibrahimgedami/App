//
//  AppCoordinatorView.swift
//  App
//
//  Created by Ibrahim Mo Gedami on 12/7/24.
//

import SwiftUI

struct AppCoordinatorView: View {

    @StateObject private var coordinator = NavigationCoordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            HomeView()
                .navigationDestination(for: AppScreen.self) { screen in
                    switch screen {
                    case .home:
                        HomeView()
                    case .details(let message):
                        DetailsView(message: message)
                    case .settings:
                        SettingsView()
                    }
                }
        }
        .environmentObject(coordinator) // Provide the coordinator to child views
    }

}
