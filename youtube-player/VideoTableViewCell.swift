//
//  VideoTableViewCell.swift
//  youtube-player
//
//  Created by David on 6/30/20.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCell(_ v: Video) {
        self.video = v
        print("title: \(v.title)")
        self.titleLabel.text = v.title
        
        let df = DateFormatter()
        df.dateFormat = "EEE, MM/dd, yyyy"
        self.dateLabel.text = df.string(from: v.published)
        print("date: \(df.string(from: v.published))")
        
        if let cachedData = CacheManager.getVideoCache(v.thumbnail) {
            self.thumbnailImageView.image = UIImage(data: cachedData)
        }
        
        guard let url = URL(string: v.thumbnail) else {return}
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error: \(error.localizedDescription)")
            }
            
            guard let data = data else {
                print("no data")
                return
            }
            
            CacheManager.setVideoCache(url.absoluteString, data)
            
            if url.absoluteString != v.thumbnail {
                print("wrong url")
                return
            }
            
            let image = UIImage(data: data)
            
            DispatchQueue.main.async {
                self.thumbnailImageView.image = image
            }
        }
        dataTask.resume()
    }
}
