//
//  Model.swift
//  youtube-player
//
//  Created by David on 6/30/20.
//  Copyright © 2020 David. All rights reserved.
//

import Foundation

class Model {
    
    func fetchVideos() {
        
        // create URL
        let url = URL(string: Constants.APIURL)
        guard url != nil else {return}
        
        // get a URLSession object
        let session = URLSession.shared
        
        // data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if let error = error {
                print("error: \(error.localizedDescription)")
            }
            
            guard let data = data else {
                print("no data")
                return
            }
            
        }
        
        dataTask.resume()
    }
    
    
}
