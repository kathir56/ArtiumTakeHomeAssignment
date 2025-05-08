//
//  ArtistSection.swift
//  Artium-TakeHomeAssignment
//
//  Created by Kathiravan Murali on 07/05/25.
//

import SwiftUI

struct ArtistSection: View {
    let artistName : String
    let lessonTitle : String
    let urlString : String
    var url : URL {
        URL(string: urlString)!
    }
    
    var body: some View {
        
        HStack(alignment:.center,spacing: 16)
        {
            
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .frame(width: 65,height: 65)
                    .clipShape(.circle)
            } placeholder: {
                Circle()
                    .fill()
                    .frame(width: 65, height: 65)
            }

            
            
            
            
            VStack(alignment:.leading,spacing: 8)
            {
                Text(artistName)
                    .font(.system(.title3, design: .rounded, weight: .bold))
                
                Text(lessonTitle)
                    .font(.system(.footnote, design: .rounded, weight: .light))
                    .foregroundStyle(.secondary)
                
            }
        }
        
        
    }
}

#Preview {
    ArtistSection(artistName: "Arijit Singh", lessonTitle: "Breath Control Techniques", urlString: "https://images.pexels.com/photos/374703/pexels-photo-374703.jpeg")
}
