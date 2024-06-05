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
    
    private
    let converterFunction: JSFunction
    
    // MARK: - Methods -
    // MARK: Initial Method
    
    public static
    func load(from url: URL) async throws -> OpenCC
    {
        try await OpenCC(from: url)
    }
    
    public static
    func load(file path: URL) throws -> OpenCC
    {
        try OpenCC(file: path)
    }
    
    private convenience
    init(from url: URL) async throws
    {
        guard let remoteContent: String = try await JSLoader.load(from: url) else {
            
            throw Error.invalidUrl
        }
        
        try self.init(content: remoteContent)
    }
    
    private convenience
    init(file path: URL) throws
    {
        guard let content = try JSLoader.loadFile(with: path) else {
            
            throw Error.invalidPath
        }
        
        try self.init(content: content)
    }
    
    private
    init(content: String) throws
    {
        guard let path = Bundle.module.url(forResource: "OpenCC", withExtension: "js"),
              let localContent: String = try JSLoader.loadFile(with: path) else {
            
            throw Error.invalidPath
        }
        
        let context: JSContext = JSContext()
        context.evaluateScript(content)
        context.evaluateScript(localContent)
        
        let converter: JSFunction = context.function(via: "converter")
        
        self.context = context
        self.converterFunction = converter
    }
    
    func converter(_ source: String, from: String, to: String) -> String
    {
        self.converterFunction(source, from, to).toString()
    }
}
