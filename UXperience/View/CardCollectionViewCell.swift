//
//  CardCollectionViewCell.swift
//  UXperience
//
//  Created by Sarah Madalena on 25/11/22.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backgroundCardView: UIView!

    @IBOutlet weak var cardView: UIView!

    @IBOutlet weak var lawImageView: UIImageView!

    @IBOutlet weak var labelBackgroundView: UIView!
    @IBOutlet weak var lawName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        self.cardView.clipsToBounds = false

//        self.cardView.layer.shadowRadius = 8
//        self.cardView.layer.shadowColor = UIColor(named: "cardShadowColor 1")?.cgColor
//        self.cardView.layer.shadowOpacity = 1
//        self.cardView.layer.shadowOffset = .init(width: 0, height: 0)

        let cornerRadius = 15.0

        self.lawImageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        self.lawImageView.layer.cornerRadius = cornerRadius
        self.lawImageView.layer.borderWidth = 2.5
        self.lawImageView.layer.borderColor = UIColor(named: "cardShadowColor")?.cgColor
        self.lawImageView.clipsToBounds = true

        self.labelBackgroundView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        self.labelBackgroundView.layer.cornerRadius = cornerRadius
        self.labelBackgroundView.clipsToBounds = true

    }

    func configureLawName(with newText: String) {
        lawName.text = newText
    }
    func configureImage(with newImage: String) {
        lawImageView.image = UIImage(named: newImage)
    }
}
