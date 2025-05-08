//
//  ArtistListView.swift
//  Artium-TakeHomeAssignment
//
//  Created by Kathiravan Murali on 07/05/25.
//

import SwiftUI

struct ArtistListView: View {
    let lessonData : LessonModel
    var body: some View {
        
        
        List(lessonData.lessons,id: \.self){ lesson in
                
                NavigationLink {
                    VideoPlayerView(videoUrl: lesson.videoURL, thumbNailUrl: lesson.videoThumbnailURL)
                } label: {
                    ArtistSection(artistName: lesson.mentorName, lessonTitle: lesson.lessonTitle, urlString: lesson.lessonImageURL)
                }

                
            }
    
        
        
    }
}

#Preview {
    NavigationStack
    {
        ArtistListView(lessonData: .init(lessons: [.init(
            mentorName: "Arijit Singh",
            lessonTitle: "Breath Control Techniques",
            videoThumbnailURL: "https://images.pexels.com/photos/1587927/pexels-photo-1587927.jpeg",
            lessonImageURL: "https://images.pexels.com/photos/3771835/pexels-photo-3771835.jpeg",
            videoURL: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4"
        )]))
    }
}
