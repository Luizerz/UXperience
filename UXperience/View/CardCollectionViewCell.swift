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

        let cornerRadius = 15.0

        self.cardView.clipsToBounds = false

        self.lawImageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        self.lawImageView.layer.cornerRadius = cornerRadius
        self.lawImageView.layer.borderWidth = 2.5
        self.lawImageView.layer.borderColor = UIColor(named: "cardShadowColor")?.cgColor
        self.lawImageView.clipsToBounds = true

        self.labelBackgroundView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        self.labelBackgroundView.layer.cornerRadius = cornerRadius
        self.labelBackgroundView.clipsToBounds = true

    }

    override func prepareForReuse() {
        self.lawImageView.image = nil
        self.lawName.text = nil
        super.prepareForReuse()
    }
    override var isSelected: Bool{
        didSet{
            if self.isSelected
            {
                self.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                self.lawImageView.layer.borderColor = UIColor(red: 123/255, green: 97/255, blue: 255/255, alpha: 0.35).cgColor
                self.lawImageView.layer.borderWidth = 3.0
            }
            else
            {
                self.transform = CGAffineTransform.identity
                self.contentView.backgroundColor = .clear
                self.lawImageView.layer.borderColor = UIColor(named: "cardShadowColor")?.cgColor
                self.lawImageView.layer.borderWidth = 2.5

            }
        }
    }

    func configureLawName(with newText: String) {
        lawName.text = newText
    }
    func configureImage(with newImage: String) {
        lawImageView.image = UIImage(named: newImage)
    }
}
