//
//  DetailViewController.swift
//  UXperience
//
//  Created by Luiz Sena on 24/11/22.
//

import UIKit

class DetailViewController: UIViewController {

    var detailViewModel: LawsModel?

    private let detailView: DetailView = {
        let view = DetailView()
        return view
    }()

    override func loadView() {
        detailView.delegate = self
        self.view = detailView
    }
}

extension DetailViewController: DetailViewDelegate {
    func titleOfNews() -> String {
        return detailViewModel!.titulo
    }

    func goToWebSite() -> String {
        let url = detailViewModel!.leiaMais
        return url
    }
}
