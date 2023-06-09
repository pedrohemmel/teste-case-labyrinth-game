//
//  HomeView.swift
//  teste-case-labyrinth-game
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 08/06/23.
//

import UIKit

class HomeView: UIView {
    weak var homeStartGameDelegate: HomeStartGameDelegate? = nil
    
    //MARK: - Views
    lazy private var startButton: UIButton = {
        let startButton = UIButton()
        startButton.setTitle("Start game", for: .normal)
        startButton.backgroundColor = .blue
        startButton.layer.cornerRadius = 10
        startButton.addTarget(nil, action: #selector(self.startButtonAction), for: .touchUpInside)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        return startButton
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
extension HomeView: ViewCode {
    func buildViewHierarchy() {
        [self.startButton].forEach({self.addSubview($0)})
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
                self.startButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                self.startButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                self.startButton.widthAnchor.constraint(equalToConstant: (self.startButton.titleLabel?.intrinsicContentSize.width ?? 0) + 20)
        ])
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
    }
}


//MARK: - Functions here
extension HomeView {
    @objc func startButtonAction() {
        self.homeStartGameDelegate?.didSelectStartButton()
    }
}
