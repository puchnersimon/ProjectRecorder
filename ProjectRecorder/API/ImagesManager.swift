//
//  ImagesManager.swift
//  ProjectRecorder
//
//  Created by Fabian Hofer on 30.06.22.
//

import Foundation

enum NetworkError: Error{
    case couldNotParseUrl
    case noResponseData
}

struct ImagesManager{
    
    func requestImages(search: String,completion: @escaping (APIResult?, Error?) -> Void) {
        
        let urlComponents = URLComponents(string: "https://api.unsplash.com/search/photos/?query=\(search)&client_id=U3NDvMpWPL1VqWGvgNlIZGW5WoNQmWIPAzJKR_vcr6A")
        
        guard let url = urlComponents?.url else{
            preconditionFailure("Failed to construct URL")
            return
        }
        
         
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            if error != nil{
                completion(nil, error)
            }
            
            guard let responseData = data else{
                completion(nil, NetworkError.noResponseData)
                return
                
            }
            
            let decoder = JSONDecoder()
            
            do{
                let responseData = try decoder.decode(APIResult.self, from: responseData)
                completion(responseData, nil)
               //var testImage = responseData.first
              //  print(testImage?.height ?? "test")
                
              print("successfull")
                
                
            } catch{
                print(error)
                completion(nil, error)
            }
            
            
            
        }
        
        
        task.resume()
    }
    
}
