//
//  ViewCode.swift
//  teste-case-labyrinth-game
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 08/06/23.
//

import Foundation

protocol ViewCode {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupViewConfiguration()
}

extension ViewCode {
    func setupViewConfiguration() {
        self.buildViewHierarchy()
        self.setupConstraints()
        self.setupAdditionalConfiguration()
    }
}
