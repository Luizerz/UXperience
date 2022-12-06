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
        self.addChild(filterView)
        self.addChild(cardCollectionView)
        filterView.view.translatesAutoresizingMaskIntoConstraints = false
        cardCollectionView.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(filterView.view)
        view.addSubview(cardCollectionView.view)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            filterView.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            filterView.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            filterView.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            filterView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filterView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            cardCollectionView.view.topAnchor.constraint(equalTo: filterView.view.bottomAnchor, constant: 15),
            cardCollectionView.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            cardCollectionView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            cardCollectionView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
        ])
    }

}
