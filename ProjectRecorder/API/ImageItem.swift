//
//  ImageItem.swift
//  ProjectRecorder
//
//  Created by Fabian Hofer on 30.06.22.
//

import Foundation


struct APIResult: Codable{
    
    init(){
        self.results = []
        self.total = 0
        self.total_pages = 0
    }
    var total : Int
    var total_pages : Int
    var results: [ImageItem]
}

struct ImageItem: Codable{
    var id: String
    var width: Int
    var height: Int
    var urls: UrlItem
}

struct UrlItem:Codable{
    var raw: URL?
    var full: URL?
    var small: URL?
}
