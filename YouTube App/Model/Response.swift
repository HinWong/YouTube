//
//  Response.swift
//  YouTube App
//
//  Created by Hin Wong on 7/4/20.
//  Copyright © 2020 Hin Wong. All rights reserved.
//

import Foundation

struct Response: Decodable {
    
    var items: [Video]?
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decode([Video].self, forKey: .items)
    }
    
    
}
