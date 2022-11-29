//
//  CardCollectionViewController.swift
//  UXperience
//
//  Created by Luiz Sena on 23/11/22.
//

import UIKit

class CardCollectionViewController: UIViewController {

    private lazy var cardView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewLayout.init()
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(
            UINib(
                nibName: "CardCollectionViewCell",
                bundle: nil
            ),
            forCellWithReuseIdentifier: "cell"
        )
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.backgroundColor = .none
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        cardSetViewContratins()
    }

    private func addSubViews() {
        self.view.addSubview(cardView)
    }

    private func cardSetViewContratins() {

        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: view.topAnchor),
            cardView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

extension CardCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell",
            for: indexPath
        ) as? CardCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }

}
