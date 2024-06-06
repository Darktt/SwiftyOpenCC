//
//  Language.swift
//
//
//  Created by Darktt on 2024/6/6.
//

import Foundation

public
extension OpenCC
{
    enum Language
    {
        case simplifiedChinese
        
        case traditionalChinese(idom: Bool, country: TraditionalCountry = .taiwan)
    }
    
    enum TraditionalCountry
    {
        case taiwan
        
        case hongKong
    }
}

extension OpenCC.Language
{
    var rawValue: String {
        
        switch self {
            
        case .simplifiedChinese:
            return "cn"
            
        case .traditionalChinese(let idom, let country):
            if case .hongKong = country {
                
                return "hk"
            }
            
            return idom ? "twp" : "tw"
        }
    }
}
