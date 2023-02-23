//
//  FilterController.swift
//  UXperience
//
//  Created by Luiz Sena on 23/11/22.
//

import UIKit

class Tag: Equatable {
    let name: String
    var isSelected: Bool
    
    init(name: String, isSelected: Bool = false) {
        self.name = name
        self.isSelected = isSelected
    }
    
    static func == (lhs: Tag, rhs: Tag) -> Bool {
        return lhs.name == rhs.name
    }
}
// -> para fazer a correcao dos bug do filtro foi utilizado um modelo que antes era só um array, dessa forma podemos fazer o modelo com o nome e com um booleano de selecionado. Dessa forma apenas verificamos o estado a partir do modelo.
class FilterController: UIViewController {
    weak var delegate: FilterCollectionViewDelegate?

    let tags: [Tag] = [
        Tag(name: "Todos", isSelected: true),
        Tag(name: "Heurística"),
        Tag(name: "Princípio"),
        Tag(name: "Gestalt"),
        Tag(name: "Viés Cognitivo")
    ]
    
    var selectedIndexPaths = [IndexPath]()

    
    private lazy var filterView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: .init()
        )
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsMultipleSelection = false
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
//        accessibilityElements = [self]
//        filterView.accessibilityLabel = "Filtragem por Categoria"
//        filterView.isAccessibilityElement = true
//        filterView.accessibilityContainerType = .semanticGroup
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

    var diselectedCellIsGone: IndexPath? = nil
}


extension FilterController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let currentTag = tags[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCell", for: indexPath) as! FilterCollectionViewCell
        cell.label.text = currentTag.name
        cell.backgroundFilterView.backgroundColor = currentTag.isSelected ? UIColor(red: 123/255, green: 97/255, blue: 255/255, alpha: 1) : .clear
        cell.label.textColor = currentTag.isSelected ? UIColor.white : UIColor(red: 203/255, green: 192/255, blue: 255/255, alpha: 1)
        cell.layer.borderColor = currentTag.isSelected ? UIColor(red: 123/255, green: 97/255, blue: 255/255, alpha: 1).cgColor : UIColor(red: 203/255, green: 192/255, blue: 255/255, alpha: 1).cgColor
        cell.isAccessibilityElement = true
        if tags[indexPath.row].isSelected {
            cell.accessibilityHint = "Filtro \(tags[indexPath.row].name) Selecionado"
        } else {
            cell.accessibilityHint = "Filtro \(tags[indexPath.row].name) Deselecionado"
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedTag = tags[indexPath.row]
        selectedTag.isSelected.toggle()
        for tag in tags {
            if tag != selectedTag {
                tag.isSelected = false
            }
        }
        collectionView.reloadData()
        
        if selectedTag.isSelected {
            delegate?.getFilterByCategory(with: selectedTag.name)
        } else {
            delegate?.getFilterByCategory(with: nil)
        }
    }
}
