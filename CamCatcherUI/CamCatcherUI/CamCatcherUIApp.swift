//
//  CamCatcherUIApp.swift
//  CamCatcherUI
//
//  Created by Daniel Cazorro Frias  on 27/2/24.
//

import SwiftUI

@main
struct CamCatcherUIApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainViewModel())
        }
    }
}
