//
//  Artium_TakeHomeAssignmentApp.swift
//  Artium-TakeHomeAssignment
//
//  Created by Kathiravan Murali on 07/05/25.
//

import SwiftUI

@main
struct Artium_TakeHomeAssignmentApp: App {
    @StateObject private var vm = LessonViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(vm)
        }
    }
}
