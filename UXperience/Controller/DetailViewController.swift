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

    convenience init(detailViewModel: LawsModel) {
        self.init()
        self.detailViewModel = detailViewModel
    }

    override func loadView() {
        detailView.delegate = self
        self.view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.largeTitleDisplayMode = .never
    }
}

extension DetailViewController: DetailViewDelegate {
    func setAccessibilityImageDescription() -> String {
        print(detailViewModel?.descrição_exemplo ?? "Error descricao")
        return detailViewModel!.descrição_exemplo
    }

    func setImageExemple() -> String {
        return detailViewModel!.exemplo
    }


    func setFrontCardTitle() -> String {
        return detailViewModel!.titulo
    }

    func setFrontCardText() -> String {
        return detailViewModel!.resumo
    }

    func titleOfNews() -> String {
        return detailViewModel!.titulo
    }

    func goToWebSite() -> String {
        let url = detailViewModel!.leiaMais
        return url
    }

    func setImageOfCard() -> String {
        return  detailViewModel!.asset
    }
}
