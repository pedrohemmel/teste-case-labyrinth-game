//
//  GameView.swift
//  teste-case-labyrinth-game
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 08/06/23.
//

import UIKit

class GameView: UIView {
    //MARK: - Views
    var gameTableView: GameTableView = {
        let gameTableView = GameTableView(frame: .zero, style: .plain)
        gameTableView.translatesAutoresizingMaskIntoConstraints = false
        return gameTableView
    }()
    var lblNumberOfCurrentState: UILabel = {
        let lblNumberOfCurrentState = UILabel()
        lblNumberOfCurrentState.textColor = .blue
        lblNumberOfCurrentState.translatesAutoresizingMaskIntoConstraints = false
        return lblNumberOfCurrentState
    }()
    lazy var gameButtons: GameButtons = {
        let gameButtons = GameButtons(frame: self.frame)
        gameButtons.translatesAutoresizingMaskIntoConstraints = false
        return gameButtons
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
extension GameView: ViewCode {
    func buildViewHierarchy() {
        [self.gameTableView, self.lblNumberOfCurrentState, self.gameButtons].forEach({self.addSubview($0)})
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.gameTableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.gameTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.gameTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.gameTableView.bottomAnchor.constraint(equalTo: self.lblNumberOfCurrentState.topAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            self.lblNumberOfCurrentState.topAnchor.constraint(equalTo: self.gameTableView.bottomAnchor, constant: 20),
            self.lblNumberOfCurrentState.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.lblNumberOfCurrentState.bottomAnchor.constraint(equalTo: self.gameButtons.topAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            self.gameButtons.topAnchor.constraint(equalTo: self.lblNumberOfCurrentState.bottomAnchor, constant: 20),
            self.gameButtons.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.gameButtons.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
    }
}

//MARK: - Functions here
extension GameView {
    func setup(lblNumberOfCurrentState: String) {
        self.lblNumberOfCurrentState.text = lblNumberOfCurrentState
    }
}
