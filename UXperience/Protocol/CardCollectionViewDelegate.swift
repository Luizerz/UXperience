//
//  CardCollectionViewDelegate.swift
//  UXperience
//
//  Created by Luiz Sena on 05/12/22.
//

import Foundation

protocol CardCollectionViewDelegate: AnyObject {
    func navigateTo(with viewModel: LawsModel)
}
