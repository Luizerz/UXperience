//
//  MainScreenViewController+ViewCode.swift
//  UXperience
//
//  Created by Luiz Sena on 23/11/22.
//

import Foundation
import UIKit

extension MainScreenViewController {

    func addSubviews() {
//        self.addChild(filterView)
        self.addChild(cardCollectionView)
        filterView.view.translatesAutoresizingMaskIntoConstraints = false
        cardCollectionView.view.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(filterView.view)
        view.addSubview(cardCollectionView.view)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
//            filterView.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
//            filterView.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            filterView.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
//            filterView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            filterView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            cardCollectionView.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            cardCollectionView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            cardCollectionView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            cardCollectionView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
        ])
    }

}
