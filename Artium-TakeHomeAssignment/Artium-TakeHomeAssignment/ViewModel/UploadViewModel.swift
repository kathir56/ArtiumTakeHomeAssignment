//
//  UploadViewModel.swift
//  Artium-TakeHomeAssignment
//
//  Created by Kathiravan Murali on 07/05/25.
//

import Foundation
import SwiftUI
class UploadManager: ObservableObject {
    enum UploadState {
        case idle, uploading(Double), success, failure
    }

    @Published var uploadState: UploadState = .idle
    private var timer: Timer?

    func startUpload() {
        uploadState = .uploading(0)
        var progress: Double = 0

        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { [weak self] t in
            guard let self = self else { return }
            withAnimation(.linear) {
                progress += 0.1
                if progress >= 1.0 {
                    t.invalidate()
                    self.uploadState = Bool.random() ? .success : .failure
                } else {
                    self.uploadState = .uploading(progress)
                }
            }
            
        }
    }

    func retryUpload() {
        startUpload()
    }
}
