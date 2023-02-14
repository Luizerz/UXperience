//
//  FilterCollectionViewDelegate.swift
//  UXperience
//
//  Created by Thaynara da Silva Andrade on 05/12/22.
//

import Foundation

protocol FilterCollectionViewDelegate: AnyObject {
    func getFilterByCategory(with labelText: String?)
}
