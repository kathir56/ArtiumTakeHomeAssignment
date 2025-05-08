//
//  NetworkManager.swift
//  Artium-TakeHomeAssignment
//
//  Created by Kathiravan Murali on 07/05/25.
//

import Foundation

class NetworkManager
{
    static let shared = NetworkManager()// Singleton
    
    func getLessons() async throws -> LessonModel?
    {
        guard let url = URL(string: "https://www.jsonkeeper.com/b/7JF5") else {return nil}
        
        do {
            let (data,response) = try await URLSession.shared.data(from: url)
            
            let res = response as! HTTPURLResponse
            
            guard res.statusCode >= 200 && res.statusCode < 400 else {return nil}
            
            
            let decodedData = try JSONDecoder().decode(LessonModel.self, from: data)
            
            return decodedData
            

        } catch let error {
    
            print(error.localizedDescription)
        }
        
        return nil
        
    }
}
