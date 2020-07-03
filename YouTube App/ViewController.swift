//
//  ViewController.swift
//  YouTube App
//
//  Created by Hin Wong on 7/3/20.
//  Copyright © 2020 Hin Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        model.getVideos()
    }


}

