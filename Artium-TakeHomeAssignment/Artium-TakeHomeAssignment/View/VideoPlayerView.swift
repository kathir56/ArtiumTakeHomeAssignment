//
//  VideoPlayerView.swift
//  Artium-TakeHomeAssignment
//
//  Created by Kathiravan Murali on 07/05/25.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let videoUrl: String
    let thumbNailUrl : String
    @State private var showSubmitPracticeView : Bool = false
    @EnvironmentObject private var vm : LessonViewModel
    var body: some View {
        VStack
        {
            VideoPlayerComponent(videoUrl: videoUrl, thumbNailUrl: thumbNailUrl)
            
            Spacer()
                .frame(height: 100)
            
            Button {
                showSubmitPracticeView.toggle()
                vm.playVideo = false
            } label: {
                
                Text("Submit Practice")
                    .font(.system(.title3, design: .rounded, weight: .medium))
                    .foregroundStyle(.white)
                    .frame(width: 220, height: 65)
                    .background(.blue)
                    .clipShape(.capsule)
            }

        }
        .sheet(isPresented: $showSubmitPracticeView) {
            SubmitPracticeView()
                .presentationDetents([.medium])
                .interactiveDismissDisabled(true)
        }
    
    }
}

#Preview {
    VideoPlayerView(videoUrl: "s", thumbNailUrl: "g")
}
