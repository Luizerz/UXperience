//
//  NewsCellTableViewCell.swift
//  UXperience
//
//  Created by Luiz Sena on 24/11/22.
//

import UIKit

class NewsCellTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
//        self.backgroundColor = .clear
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureNewsTitle(with myText: String) {
        self.titleLabel.text = myText
    }
    
}
