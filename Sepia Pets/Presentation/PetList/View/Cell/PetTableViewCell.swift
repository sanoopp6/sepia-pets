//
//  PetTableViewCell.swift
//  Sepia Pets
//
//  Created by Sanoop PM on 30/11/22.
//

import UIKit

class PetTableViewCell: UITableViewCell {

    @IBOutlet var petImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        self.petImageView.image = nil
        self.titleLabel.text = nil
    }
    
    
    var petData: Pet? {
            didSet {
                titleLabel.text = petData?.title
                petImageView.load(url: URL(string:  (petData?.imageUrl)!)!) // we can use libraries like kingfisher
            }
        }
}
