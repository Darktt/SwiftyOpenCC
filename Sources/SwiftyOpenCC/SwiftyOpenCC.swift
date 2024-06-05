//
//  SwiftyOpenCC.swift
//
//  Created by Eden on 2024/6/5.
//

import JavaScriptCore

public
class OpenCC
{
    // MARK: - Properties -
    
    private
    let context: JSContext
    
    // MARK: - Methods -
    // MARK: Initial Method
    
    public static
    func load(from url: URL) async throws -> OpenCC
    {
        try await OpenCC(from: url)
    }
    
    private
    init(from url: URL) async throws
    {
        guard let string: String = try await JSLoader.load(from: url) else {
            
            throw Error.invalidUrl
        }
        
        let context: JSContext = JSContext()
        context.evaluateScript(string)
        
        self.context = context
    }
}
