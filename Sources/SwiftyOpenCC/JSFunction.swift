//
//  JSFunction.swift
//
//  Created by Darktt on 23/8/24.
//  Copyright © 2023 Darktt. All rights reserved.
//

import JavaScriptCore

internal
extension JSContext
{
    func function(via name: String) -> JSFunction
    {
        let value: JSValue = self[name]
        let function = JSFunction(value: value)
        
        return function
    }
}

internal
struct JSFunction
{
    fileprivate
    let value: JSValue
    
    func callAsFunction(_ arguments: Any...) -> JSValue
    {
        self.value.call(withArguments: arguments)
    }
}
