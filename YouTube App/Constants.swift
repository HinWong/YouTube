//
//  Constants.swift
//  YouTube App
//
//  Created by Hin Wong on 7/3/20.
//  Copyright © 2020 Hin Wong. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = "[YOUR_API_KEY]"
    static var PLAYLIST_ID = "PLoSWVnSA9vG-6geT_u92P9ttBfRLVFhLH"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
}
