//
//  DetailView.swift
//  UXperience
//
//  Created by Luiz Sena on 24/11/22.
//

import UIKit
import SwiftUI

class DetailView: UIView {

    weak var delegate: DetailViewDelegate!
    private var textValue: String = ""
    private var titleValue: String = ""
    private var imageURL: String = ""
    private var exempleURL: String = ""
    private var accessibilityImageDescription: String = ""



    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Leia mais"
        label.textColor = UIColor(named: "newsTitleColor")
        return label
    }()


    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(named: "background")
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = true
        tableView.register(UINib(nibName: "NewsCellTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.isScrollEnabled = false
        return tableView
    }()


    convenience init() {
        self.init(frame: .zero)
        self.backgroundColor = UIColor(named: "background")
        tableView.flashScrollIndicators()

    }

    override func didMoveToWindow() {
        super.didMoveToWindow()
        textValue = delegate.setFrontCardText()
        titleValue = delegate.setFrontCardTitle()
        imageURL = delegate.setImageOfCard()
        exempleURL = delegate.setImageExemple()
        accessibilityImageDescription = delegate.setAccessibilityImageDescription()
        setLayout()
    }
    private func setLayout() {

        let swiftUIView = UIHostingConfiguration {
            var view = SwiftUIView()
            view.textFrontCard = self.textValue
            view.titleFrontCard = self.titleValue
            view.imageURL = self.imageURL
            view.exemploURL = self.exempleURL
            view.accessibilityImageDescription = self.accessibilityImageDescription
            return view
        }.makeContentView()

        swiftUIView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(swiftUIView)
        self.addSubview(titleLabel)
        self.addSubview(tableView)
        NSLayoutConstraint.activate([
            swiftUIView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            swiftUIView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/1.4),
            swiftUIView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),

            titleLabel.topAnchor.constraint(equalTo: swiftUIView.bottomAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 27),

            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

        ])
        titleLabel.accessibilityTraits = .header
    }
}

extension DetailView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
        ) as? NewsCellTableViewCell else {
            return UITableViewCell()
        }

        let myText = delegate!.titleOfNews()
        cell.configureNewsTitle(with: myText)
        cell.accessibilityTraits = .link
        cell.accessibilityHint = "Toque duas vezes para se redirecionar ao Safari."

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url: String = delegate!.goToWebSite()
        print(indexPath) // -> selecao da news
        print(url)
        if let url = URL(string: url) {
            UIApplication.shared.open(url)
            tableView.deselectRow(at: indexPath, animated: false)
        }
    }

}
