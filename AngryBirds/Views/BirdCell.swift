//
//  BirdCell.swift
//  AngryBirds
//
//  Created by Chelsea Troy on 4/13/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import UIKit

class BirdCell: UITableViewCell {

    @IBOutlet weak var birdNameLabel: UILabel!
    @IBOutlet weak var birdDescriptionLael: UILabel!
    @IBOutlet weak var birdImageView: UIImageView!
    
    var bird: Bird? {
        didSet {
            self.birdNameLabel.text = bird?.name
            self.birdDescriptionLael.text = bird?.description
            self.accessoryType = bird!.confirmedSighting ? .checkmark : .none
            
            DispatchQueue.global(qos: .userInitiated).async {
                guard
                    let confirmedBirdImageUrl = URL(string: self.bird!.imageUrl),
                      let birdImageData = NSData(contentsOf: confirmedBirdImageUrl),
                      let birdImage = UIImage(data: birdImageData as Data)
                else { return }
                
                DispatchQueue.main.async {
                    self.birdImageView.image = birdImage
                    self.birdImageView.layer.cornerRadius = self.birdImageView.frame.width / 2
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
