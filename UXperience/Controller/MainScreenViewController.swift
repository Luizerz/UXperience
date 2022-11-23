//
//  ViewController.swift
//  UXperience
//
//  Created by Luiz Sena on 22/11/22.
//

import UIKit

class MainScreenViewController: UIViewController {

    private lazy var searchBar = UISearchController(searchResultsController: nil)

    private(set) var filterView = FilterController()
    private(set) var cardCollectionView = CardCollectionViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.searchResultsUpdater = self
        searchBar.obscuresBackgroundDuringPresentation = false
        searchBar.searchBar.placeholder = "Procurar Lei"
        navigationItem.searchController = searchBar

        // MARK: - TODO: trocar por protocolo ViewCode
        addSubviews()
        setupConstraints()
    }
}

extension MainScreenViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print("funfou")
    }
}

