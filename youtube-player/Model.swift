//
//  Model.swift
//  youtube-player
//
//  Created by David on 6/30/20.
//  Copyright © 2020 David. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    func videosFetched(_ videos: [Video])
}

class Model {
    
    var delegate: ModelDelegate?
    
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
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data)
                
                guard let items = response.items else { return }
                DispatchQueue.main.async {
                    self.delegate?.videosFetched(items)
                }
            }
            catch {
                print("catched")
            }
        }
        dataTask.resume()
    }
}
