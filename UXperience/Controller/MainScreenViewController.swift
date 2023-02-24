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
    private var detailViewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailViewModel.binding = self

        navigationItem.hidesSearchBarWhenScrolling = false

        searchBar.searchResultsUpdater = self
        searchBar.obscuresBackgroundDuringPresentation = false
        searchBar.searchBar.placeholder = "Procurar Lei"
        navigationItem.searchController = searchBar
        cardCollectionView.viewModel = detailViewModel
        cardCollectionView.delegate = self
        filterView.delegate = self
        filterView.searchDismissDelegate = self

        searchBar.searchBar.delegate = self

        // MARK: - TODO: trocar por protocolo ViewCode
        addSubviews()
        setupConstraints()
    }
}

extension MainScreenViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        detailViewModel.filterJson(with: searchController.searchBar.text!)
    }
}

extension MainScreenViewController: CardCollectionViewDelegate {
    func navigateTo(with viewModel: LawsModel) {
        let rootView = DetailViewController(detailViewModel: viewModel)
        navigationController?.pushViewController(rootView, animated: true)
    }
}

extension MainScreenViewController: FilterCollectionViewDelegate {
    func getFilterByCategory(with labelText: String?) {
        searchBar.searchBar.text = nil
        detailViewModel.getFilterByCategory(with: labelText)
    }
}

// Data Binding
extension MainScreenViewController: ViewModelBinding {
    func reloadCollection() {
        cardCollectionView.cardView.reloadData()
    }
}

extension MainScreenViewController: DismissDelegate {
    func dismissSearchEdit(with labelText: String) {
        self.searchBar.dismiss(animated: true)
        detailViewModel.getFilterByCategory(with: labelText)
    }
}

extension MainScreenViewController: UISearchBarDelegate {

    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        filterView.foo()
        return true
    }

    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {

        return true
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.searchBar.text = nil
    }
}
