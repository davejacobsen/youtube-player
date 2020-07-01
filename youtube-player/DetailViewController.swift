//
//  DetailViewController.swift
//  youtube-player
//
//  Created by David on 6/30/20.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var webKitView: WKWebView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        titleLabel.text = ""
        dateLabel.text = ""
        descriptionTextView.text = ""
        
        guard video != nil else {return}
        
        let embedUrlString = "https://www.youtube.com/embed/" + video!.videoId
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webKitView.load(request)
        
        titleLabel.text = video!.title
        
        let df = DateFormatter()
        df.dateFormat = "EEE, MM/dd, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        descriptionTextView.text = video!.description
    }
}
