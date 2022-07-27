//
//  Character.swift
//  BreakingBadCharacters
//
//  Created by Илья Гусаров on 11.06.2022.
//

import Foundation

struct Character: Decodable {
    let charId: Int?
    let name: String?
    let nickname: String?
    let birthday: String?
    let status: String?
    let img: String?
    
    var getName: String {
        "\(charId!). \(name!)"
    }
    
    init(courseData: [String: Any]) {
        charId = courseData["char_id"] as? Int
        name = courseData["name"] as? String
        nickname = courseData["nickname"] as? String
        birthday = courseData["birthday"] as? String
        status = courseData["status"] as? String
        img = courseData["img"] as? String
    }
    
    static func getCharacters(with value: Any) -> [Character] {
        guard let character = value as? [[String:Any]] else { return [] }
        return character.compactMap() { Character(courseData: $0)}
    }
}
