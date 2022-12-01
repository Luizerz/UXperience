//
//  CardCollectionViewCell.swift
//  UXperience
//
//  Created by Sarah Madalena on 25/11/22.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lawName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureLawName(with newText: String) {
        lawName.text = newText
    }
}
