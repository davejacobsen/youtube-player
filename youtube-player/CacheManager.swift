//
//  CacheManager.swift
//  youtube-player
//
//  Created by David on 6/30/20.
//  Copyright © 2020 David. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String: Data]()
    
    static func setVideoCache(_ url: String, _ data: Data?) {
        
        cache[url] = data
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        return cache[url]
    }
}
