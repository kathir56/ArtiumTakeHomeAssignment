//
//  VideoPlayerComponent.swift
//  Artium-TakeHomeAssignment
//
//  Created by Kathiravan Murali on 07/05/25.
//

import SwiftUI
import AVKit

struct VideoPlayerComponent: View {
    
    let videoUrl: String
    let thumbNailUrl : String
    @EnvironmentObject private var vm : LessonViewModel
    
    @State private var showThumbnail = true
    @State private var player : AVPlayer?
    var body: some View {
        ZStack {
            VideoPlayer(player: player)
                .frame(height: 200)
                .padding()
                .shadow(color: .white, radius: 3)
    
                
            if showThumbnail {
                
                
                AsyncImage(url: URL(string: thumbNailUrl)) { image in
                    image
                        .resizable()
                        .frame(height: 200)
                        .padding()
                    
                } placeholder: {
                    Rectangle()
                        .fill()
                        .frame(height: 200)
                        .padding()
                    
                }
                
                
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 32))
                    .foregroundStyle(.white)
                    .padding()
                    .onTapGesture {
                        player?.play()
                        withAnimation(.linear) {
                            
                            showThumbnail = false
                        }
                        
                        
                    }
            }
                
        }
        .onAppear {
            player = AVPlayer(url: URL(string: videoUrl)!)
            
        }
        .onReceive(vm.$playVideo) { value in
            if value
            {
                player?.play()
                
            }
            else
            {
                player?.pause()
            
            }
        }
    
        
        
        .navigationTitle("Tutorial")
    }
}

#Preview {
    VideoPlayerComponent(videoUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4", thumbNailUrl: "https://images.pexels.com/photos/374703/pexels-photo-374703.jpeg")
}

