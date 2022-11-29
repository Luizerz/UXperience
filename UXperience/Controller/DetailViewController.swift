//
//  DetailViewController.swift
//  UXperience
//
//  Created by Luiz Sena on 24/11/22.
//

import UIKit

class DetailViewController: UIViewController {

    private var detailViewModel: DetailViewModel = DetailViewModel()

    private let detailView: DetailView = {
        let view = DetailView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = detailView
    }
}
