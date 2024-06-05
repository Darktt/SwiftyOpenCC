//
//  JSLoader.swift
//
//  Created by Eden on 2024/6/5.
//

import Foundation

internal
class JSLoader
{
    static
    func loadFile(with path: URL) throws -> String?
    {
        let jsContent = try String(contentsOf: path)
        
        return jsContent
    }
    
    static
    func load(from url: URL) async throws -> String?
    {
        let result: String? = try await withCheckedThrowingContinuation {
            
            contunuation in
            
            let urlSession = URLSession.shared
            let task: URLSessionDataTask = urlSession.dataTask(with: url) { 
                
                data, response, error in
                
                if let error = error {
                    
                    contunuation.resume(throwing: error)
                }
                
                if let data = data {
                    
                    let jsContent = String(data: data, encoding: .utf8)
                    
                    contunuation.resume(returning: jsContent)
                }
            }
            task.resume()
        }
        
        return result
    }
}
