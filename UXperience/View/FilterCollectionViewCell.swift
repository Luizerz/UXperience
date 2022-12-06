//
//  FilterCollectionViewCell.swift
//  UXperience
//
//  Created by Luiz Sena on 23/11/22.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var backgroundFilterView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.white.cgColor
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let selection = collectionView.cellForItem(at: indexPath) as! FilterCollectionViewCell
            selection.backgroundFilterView.backgroundColor = .systemIndigo
        }
    }
}


