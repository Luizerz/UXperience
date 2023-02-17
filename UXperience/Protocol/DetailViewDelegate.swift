//
//  DetailViewDelegate.swift
//  UXperience
//
//  Created by Luiz Sena on 05/12/22.
//

import Foundation

protocol DetailViewDelegate: AnyObject {
    func goToWebSite()-> String
    func titleOfNews()-> String
    func setFrontCardTitle()-> String
    func setFrontCardText()-> String
    func setImageOfCard()-> String
    func setImageExemple()-> String
}
