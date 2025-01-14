//
//  NavigationCoordinator.swift
//  App
//
//  Created by Ibrahim Mo Gedami on 12/7/24.
//

import SwiftUI

class NavigationCoordinator: ObservableObject {

    @Published var path = NavigationPath()
    
    // Push a view
    func push<T: Hashable>(_ view: T) {
        path.append(view)
    }
    
    // Pop a view
    func pop() {
        path.removeLast()
    }
    
    // Pop to the root
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    // Reset navigation
    func reset() {
        path = NavigationPath()
    }

}

enum AppScreen: Hashable, Identifiable {
    
    var id: UUID {
        return UUID()
    }
    case home
    case details(String)
    case settings
    case modalExample
    case anotherModal

}
