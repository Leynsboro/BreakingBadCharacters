//
//  CharacterListViewController.swift
//  BreakingBadCharacters
//
//  Created by Илья Гусаров on 11.06.2022.
//

import UIKit

class CharacterListViewController: UITableViewController {
    
    private let mainUrl = "https://breakingbadapi.com/api/characters"
    private var characters: [Character] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCharacters()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let character = characters[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.text = character.getName
        content.secondaryText = character.nickname
        
        cell.contentConfiguration = content

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let index = tableView.indexPathForSelectedRow else { return }
        guard let infoVC = segue.destination as? InfoViewController else { return }
        infoVC.character = characters[index.row]
    }
    
    private func fetchCharacters() {
        NetworkManager.shared.fetchCharacter(with: mainUrl) { character in
            self.characters = character
            self.tableView.reloadData()
        }
    }

}
