//
//  NetworkManager.swift
//  BreakingBadCharacters
//
//  Created by Илья Гусаров on 11.06.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCharacter(with mainUrl: String, completion: @escaping([Character]) -> ()) {
        guard let url = URL(string: mainUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error ?? "error")
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode([Character].self, from: data)
                DispatchQueue.main.async {
                    completion(decoded)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
