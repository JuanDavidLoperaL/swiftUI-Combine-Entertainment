//
//  EntertainmentApp.swift
//  EntertainmentApp
//
//  Created by Juan david Lopera lopez on 9/05/22.
//

import SwiftUI

@main
struct EntertainmentApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel())
        }
    }
}
