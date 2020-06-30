//
//  Constants.swift
//  youtube-player
//
//  Created by David on 6/30/20.
//  Copyright © 2020 David. All rights reserved.
//

import Foundation

struct Constants {
    
    static var APIKey = "AIzaSyBdMrUb_hWl96CgLMtVF7Nyj8hZXSLgs1I"
    static var playlistID = "PLuoeXyslFTuZRi4q4VT6lZKxYbr7so1Mr"
    static var APIURL = "https://www.googleapis.com/youtube/v3/playlists?part=snippet&id=\(Constants.playlistID)&key=\(Constants.APIKey)"
}
