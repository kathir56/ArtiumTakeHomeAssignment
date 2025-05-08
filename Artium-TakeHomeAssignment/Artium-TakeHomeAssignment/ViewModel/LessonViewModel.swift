//
//  LessonViewModel.swift
//  Artium-TakeHomeAssignment
//
//  Created by Kathiravan Murali on 07/05/25.
//

import Foundation

@MainActor
class LessonViewModel: ObservableObject
{
    private let networkManager = NetworkManager.shared
    
    
    
    init() {
        loadData()
    }
    
    @Published var lessonData : LessonModel?
    @Published var playVideo : Bool = true
    
    
    
    private func loadData()
    {
        Task{ [weak self] in
            do
            {
                self?.lessonData = try await self?.networkManager.getLessons()
            }
            catch
            {
                print(error.localizedDescription)
            }
            
        }
    }
}
