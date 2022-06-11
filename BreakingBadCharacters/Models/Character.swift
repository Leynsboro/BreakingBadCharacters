//
//  Character.swift
//  BreakingBadCharacters
//
//  Created by Илья Гусаров on 11.06.2022.
//

import Foundation

struct Character: Decodable {
    let char_id: Int
    let name: String
    let nickname: String
    let birthday: String
    let status: String
    let img: String
    
    var getName: String {
        "\(char_id). \(name)"
    }
}
