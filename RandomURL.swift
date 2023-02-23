//
//  RandomURL.swift
//  randomduck
//
//  Created by dipro on 2/22/23.
//

import Foundation
import Darwin

func randomUrl() -> URL! {
    let imgNum: Int = Int(arc4random_uniform(285))
    let urlStr: String = "https://random-d.uk/api/\(imgNum).jpg"
    
    return URL(string: urlStr)
}
