//
//  Video.swift
//  youtube-player
//
//  Created by David on 6/30/20.
//  Copyright © 2020 David. All rights reserved.
//

import Foundation

struct Video: Decodable {
    var ID = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var datePublished: Date
    
    enum CodingKeys: String, CodingKey {
        case datePublished = "publishedAt"
        case title
        case ID = "videoID"
        case thumbnail = "url"
        case description
        
        case snippet
        case thumbnails
        case high
        case resourceId
    }
    
    init (from decoder: Decoder) throws {
       let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        self.datePublished = try snippetContainer.decode(Date.self, forKey: .datePublished)
        
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.ID = try resourceIdContainer.decode(String.self, forKey: .ID)
    }
}
