//
//  ViewModel.swift
//  UXperience
//
//  Created by Luiz Sena on 23/11/22.
//

import Foundation
import UIKit

struct DetailViewModel {

    // virá da camada service
    let newsLabel: String = "Artigo Medium"

    func configureNewsLabel(with label: UILabel)  {
        label.text = self.newsLabel
    }
}
