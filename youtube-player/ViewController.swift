//
//  ViewController.swift
//  youtube-player
//
//  Created by David on 6/30/20.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.fetchVideos()
    }

}

