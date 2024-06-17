//
//  JSContextExtension.swift
//
//  Created by Darktt on 23/8/30.
//  Copyright © 2023 Darktt. All rights reserved.
//

import JavaScriptCore

internal
extension JSContext
{
    subscript<Key>(_ key: Key) -> JSValue where Key: (NSCopying & NSObjectProtocol)
    {
        set {
            
            self.setObject(newValue, forKeyedSubscript: key)
        }
        
        get {
            
            self.objectForKeyedSubscript(key)
        }
    }
    
    subscript(_ key: Any) -> JSValue
    {
        self.objectForKeyedSubscript(key)
    }
}
