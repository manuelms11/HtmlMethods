//
//  Dictionary.swift
//  PlaylistReader
//
//  Created by David Cortes on 16/6/21.
//

import Foundation

extension Dictionary {
    
    //id=8&name=swift&artistName=david
    func toData() -> Data? {
        return map {key, value in
            let key = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            let value = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            
            return "\(key)=\(value)"
        }.joined(separator: "&").data(using: .utf8)
    }
}
