//
//  HomeView.swift
//  Artium-TakeHomeAssignment
//
//  Created by Kathiravan Murali on 07/05/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm : LessonViewModel
    @State private var showAlertView : Bool = false
    var body: some View {
        NavigationStack
        {
            ArtistListView(lessonData: vm.lessonData ?? mockData)
                .navigationTitle("Artium")

        }
    }
}

#Preview {
    NavigationStack
    {
        HomeView()
    }
}
