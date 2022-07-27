//
//  InfoViewController.swift
//  BreakingBadCharacters
//
//  Created by Илья Гусаров on 11.06.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var nicknameLabel: UILabel!
    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var birthdayLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    
    
    var character: Character!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = character.name
        nicknameLabel.text = character.nickname
        birthdayLabel.text = character.birthday
        statusLabel.text = character.status
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        DispatchQueue.global().async {
            guard let url = URL(string: self.character.img ?? "") else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.characterImage.image = UIImage(data: imageData)
                self.activityIndicator.stopAnimating()
            }
        }
    }

}
