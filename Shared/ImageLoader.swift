//
//  AsyncImage.swift
//  Async
//
//  Created by Armin Kroll on 16/6/21.
//

import Foundation
import UIKit

struct ImageLoader {
    
    enum MyError: Error {
        case badResponse, badImage
    }
    
    static let defaultUrlString: String = "https://quantifyapp.com/wp-content/uploads/2019/10/Apple@0.5x.png"
    private var url : URL
    
    init(urlString: String = defaultUrlString) {
        guard let url = URL(string: urlString) else { fatalError() }
        self.url = url
    }
    
    func load() async throws -> UIImage {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200  else {
            throw MyError.badResponse
        }
        
        guard let image = UIImage(data: data) else {
            throw MyError.badImage
        }
        
        return image
    }
}

