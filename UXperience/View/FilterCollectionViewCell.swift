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
    //    override func awakeFromNib() {
    //        super.awakeFromNib()
    //        let label = UILabel()
    //        label.textColor = .red
    //        label.font = .systemFont(ofSize: 24.0)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.white.cgColor
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let selection = collectionView.cellForItem(at: indexPath) as! FilterCollectionViewCell
            selection.backgroundFilterView.backgroundColor = .systemIndigo
            
            
        }
        
        
        
        //    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        //        if let cell = collectionView.cellForItem(at: index}Path) {
        //            cell.contentView.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        //        }
        //    }
        //
        //    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        //        if let cell = collectionView.cellForItem(at: indexPath) {
        //            cell.contentView.backgroundColor = nil
        //        }
        //    }
        
    }
    
}
