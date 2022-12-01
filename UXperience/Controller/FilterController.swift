//
//  FilterController.swift
//  UXperience
//
//  Created by Luiz Sena on 23/11/22.
//

import UIKit

class FilterController: UIViewController {

    let nameArray: [String] = ["Todos", "Heuristica", "Principles", "Gestalt", "Cognitive"]
    
    var selectedIndexPaths = [IndexPath]()
    
    private lazy var filterView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: .init()
        )
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsMultipleSelection = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(
            UINib(
                nibName: "FilterCollectionViewCell",
                bundle: nil
            ),
            forCellWithReuseIdentifier: "filterCell"
        )
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        filterViewConstraints()
    }

    private func addSubViews() {
        self.view.addSubview(filterView)
    }

    private func filterViewConstraints() {

        NSLayoutConstraint.activate([
            filterView.topAnchor.constraint(equalTo: view.topAnchor),
            filterView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            filterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filterView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}


extension FilterController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCell", for: indexPath) as! FilterCollectionViewCell
        cell.label.text = "\(nameArray[indexPath.row])"
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item \(indexPath.row + 1)")
        let cell = collectionView.cellForItem(at: indexPath) as! FilterCollectionViewCell
        cell.backgroundFilterView.backgroundColor = .systemIndigo
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
            let cell = collectionView.cellForItem(at: indexPath) as! FilterCollectionViewCell
            cell.backgroundFilterView.backgroundColor = nil

        }

}
