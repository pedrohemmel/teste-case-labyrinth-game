//
//  GameTableViewCell.swift
//  teste-case-labyrinth-game
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 08/06/23.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    var title: UILabel = {
        let title = UILabel()
        title.textColor = .link
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViewConfiguration()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GameTableViewCell: ViewCode {
    func buildViewHierarchy() {
        [title].forEach({self.addSubview($0)})
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.title.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {
        
    }
}
