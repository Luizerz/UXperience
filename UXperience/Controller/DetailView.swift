//
//  DetailView.swift
//  UXperience
//
//  Created by Luiz Sena on 24/11/22.
//

import UIKit
import SwiftUI

class DetailView: UIView {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Leia mais sobre"
        label.textColor = UIColor(named: "newsTitleColor")
//        label.backgroundColor = .blue
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


    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        setLayout()
        self.backgroundColor = UIColor(named: "background")
        tableView.flashScrollIndicators()

    }

    private func setLayout() {

        let swiftUIView = UIHostingConfiguration {
            SwiftUIView()
        }.makeContentView()

        swiftUIView.translatesAutoresizingMaskIntoConstraints = false
//        swiftUIView.backgroundColor = .systemRed
        self.addSubview(swiftUIView)
        self.addSubview(titleLabel)
        self.addSubview(tableView)

        NSLayoutConstraint.activate([
            swiftUIView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            swiftUIView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/1.5),
            swiftUIView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),


            titleLabel.topAnchor.constraint(equalTo: swiftUIView.bottomAnchor, constant: 17),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 27),

            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

        ])
    }

}

extension DetailView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
        ) as? NewsCellTableViewCell else { return UITableViewCell() }
            // codigo para mudar a cor do item selecionado na tableview
//        let backgroundView = UIView()
//        backgroundView.backgroundColor = UIColor.orange
//        cell.selectedBackgroundView = backgroundView
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath) // -> selecao da news
        if let url = URL(string: "https://www.hackingwithswift.com") {
            UIApplication.shared.open(url)
            tableView.deselectRow(at: indexPath, animated: false)
        }
    }

}
