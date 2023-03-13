//
//  AnimationView.swift
//  UXperience
//
//  Created by Luiz Sena on 10/03/23.
//

import Foundation
import SwiftUI
import WebKit


struct AnimationView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIImageView {
        guard let gifImageArray = GIF(named: "dohertyImage") else {
            return UIImageView(frame: .zero)
        }
        let myImageView = UIImageView()
        myImageView.image = UIImage.animatedImage(with: gifImageArray.sequence, duration: 4)
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        return myImageView
    }

    func updateUIView(_ uiView: UIImageView, context: Context) {

    }

    func sizeThatFits(_ proposal: ProposedViewSize, uiView: UIImageView, context: Context) -> CGSize? {
        guard
            let width = proposal.width,
            let height = proposal.height
        else { return nil }

        return CGSize(width: width, height: height)
    }


}
