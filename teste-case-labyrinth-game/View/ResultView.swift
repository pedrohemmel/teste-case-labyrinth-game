//
//  ResultView.swift
//  teste-case-labyrinth-game
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 09/06/23.
//

import UIKit

class ResultView: UIView {
    //MARK: - Views
    private var lblResult: UILabel = {
       let lblResult = UILabel()
        lblResult.text = "Congratulations! You won the labyrinth."
        lblResult.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        lblResult.numberOfLines = 2
        lblResult.translatesAutoresizingMaskIntoConstraints = false
        return lblResult
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViewConfiguration()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - ViewCode extension
extension ResultView: ViewCode {
    func buildViewHierarchy() {
        [self.lblResult].forEach({self.addSubview($0)})
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.lblResult.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.lblResult.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.lblResult.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
    }
}
