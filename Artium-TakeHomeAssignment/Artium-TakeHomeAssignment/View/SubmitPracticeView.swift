//
//  SubmitPracticeView.swift
//  Artium-TakeHomeAssignment
//
//  Created by Kathiravan Murali on 07/05/25.
//

import SwiftUI
import AVKit

struct SubmitPracticeView: View {
    @StateObject var uploadManager = UploadManager()
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var vm : LessonViewModel

    var body: some View {
        VStack(spacing: 24) {
            Text("Upload Your Practice Recording")
                .font(.title3)
                .bold()
            
            switch uploadManager.uploadState {
            case .idle:
                Button("Choose File & Upload") {
                    uploadManager.startUpload()
                }

            case .uploading(let progress):
                VStack(alignment:.center,spacing: 16){
                    ProgressView(value: progress)
                    Text("Uploading... \(Int(progress * 100))%")
                        .contentTransition(.numericText())
                        
                }

            case .success:
                VStack(alignment:.center,spacing: 16) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                        .font(.system(size: 50))
                    
                    Text("Upload Successful!")
                        .font(.subheadline)
                        .fontWeight(.regular)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                        dismiss()
                        vm.playVideo = true
                    }
                }

            case .failure:
                VStack(alignment:.center,spacing: 16){
                    Image(systemName: "xmark.octagon.fill")
                        .foregroundColor(.red)
                        .font(.system(size: 50))
                    
                    Text("Upload Failed. Please try again.")
                        .font(.subheadline)
                        .fontWeight(.regular)
                    Button("Retry") {
                        uploadManager.retryUpload()
                    }
                }
            }

    
        }
        .padding()
        
    }
}

#Preview {
    SubmitPracticeView()
}
