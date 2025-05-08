//
//  LessonModel.swift
//  Artium-TakeHomeAssignment
//
//  Created by Kathiravan Murali on 07/05/25.
//

struct LessonModel: Codable , Hashable{
    let lessons: [Lesson]
}

// MARK: - Lesson
struct Lesson: Codable, Hashable {
    let mentorName : String
    let lessonTitle: String
    let videoThumbnailURL : String
    let lessonImageURL: String
    let videoURL: String

    enum CodingKeys: String, CodingKey {
        case mentorName = "mentor_name"
        case lessonTitle = "lesson_title"
        case videoThumbnailURL = "video_thumbnail_url"
        case lessonImageURL = "lesson_image_url"
        case videoURL = "video_url"
    }
}
