//
//  GameButtons.swift
//  teste-case-labyrinth-game
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 08/06/23.
//

import UIKit

class GameButtons: UIView {
    
    weak var gameMovimentationsDelegate: GameMovimentationsDelegate? = nil
    private var gameViewFrame: CGRect?
    private var allowedMovimentations: (up: Bool, down: Bool, left: Bool, right: Bool)?
    
    //MARK: - Views
    lazy private var btnUp: UIButton = {
        let btnUp = UIButton()
        btnUp.setTitle("Up", for: .normal)
        btnUp.setImage(UIImage(systemName: "arrow.up"), for: .normal)
        btnUp.backgroundColor = .blue
        btnUp.layer.cornerRadius = 10
        btnUp.addTarget(nil, action: #selector(self.btnUpAction), for: .touchUpInside)
        btnUp.translatesAutoresizingMaskIntoConstraints = false
        return btnUp
    }()
    lazy private var btnDown: UIButton = {
        let btnDown = UIButton()
        btnDown.setTitle("Down", for: .normal)
        btnDown.setImage(UIImage(systemName: "arrow.down"), for: .normal)
        btnDown.backgroundColor = .blue
        btnDown.layer.cornerRadius = 10
        btnDown.addTarget(nil, action: #selector(self.btnDownAction), for: .touchUpInside)
        btnDown.translatesAutoresizingMaskIntoConstraints = false
        return btnDown
    }()
    lazy private var btnLeft: UIButton = {
        let btnLeft = UIButton()
        btnLeft.setTitle("Left", for: .normal)
        btnLeft.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        btnLeft.backgroundColor = .blue
        btnLeft.layer.cornerRadius = 10
        btnLeft.addTarget(nil, action: #selector(self.btnLeftAction), for: .touchUpInside)
        btnLeft.translatesAutoresizingMaskIntoConstraints = false
        return btnLeft
    }()
    lazy private var btnRight: UIButton = {
        let btnRight = UIButton()
        btnRight.setTitle("Right", for: .normal)
        btnRight.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        btnRight.backgroundColor = .blue
        btnRight.layer.cornerRadius = 10
        btnRight.addTarget(nil, action: #selector(self.btnRightAction), for: .touchUpInside)
        btnRight.translatesAutoresizingMaskIntoConstraints = false
        return btnRight
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.gameViewFrame = frame
        self.setupViewConfiguration()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - ViewCode extension
extension GameButtons: ViewCode {
    func buildViewHierarchy() {
        [self.btnUp, self.btnDown, self.btnLeft, self.btnRight].forEach({self.addSubview($0)})
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.btnUp.topAnchor.constraint(equalTo: self.topAnchor),
            self.btnUp.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.btnUp.trailingAnchor.constraint(equalTo: self.btnDown.leadingAnchor, constant: -20),
            self.btnUp.bottomAnchor.constraint(equalTo: self.btnLeft.topAnchor, constant: -20),
            self.btnUp.widthAnchor.constraint(equalToConstant: ((self.gameViewFrame?.width ?? 0) / 2) - 40),
            self.btnUp.heightAnchor.constraint(equalToConstant: (self.gameViewFrame?.height ?? 0) * 0.1)
        ])
        NSLayoutConstraint.activate([
            self.btnDown.topAnchor.constraint(equalTo: self.topAnchor),
            self.btnDown.leadingAnchor.constraint(equalTo: self.btnUp.trailingAnchor, constant: 20),
            self.btnDown.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.btnDown.bottomAnchor.constraint(equalTo: self.btnRight.topAnchor, constant: -20),
            self.btnDown.widthAnchor.constraint(equalToConstant: ((self.gameViewFrame?.width ?? 0) / 2) - 40),
            self.btnDown.heightAnchor.constraint(equalToConstant: (self.gameViewFrame?.height ?? 0) * 0.1)
        ])
        NSLayoutConstraint.activate([
            self.btnLeft.topAnchor.constraint(equalTo: self.btnUp.bottomAnchor, constant: 20),
            self.btnLeft.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.btnLeft.trailingAnchor.constraint(equalTo: self.btnRight.leadingAnchor, constant: -20),
            self.btnLeft.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.btnLeft.widthAnchor.constraint(equalToConstant: ((self.gameViewFrame?.width ?? 0) / 2) - 40),
            self.btnLeft.heightAnchor.constraint(equalToConstant: (self.gameViewFrame?.height ?? 0) * 0.1)
        ])
        NSLayoutConstraint.activate([
            self.btnRight.topAnchor.constraint(equalTo: self.btnDown.bottomAnchor, constant: 20),
            self.btnRight.leadingAnchor.constraint(equalTo: self.btnLeft.trailingAnchor, constant: 20),
            self.btnRight.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.btnRight.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.btnRight.widthAnchor.constraint(equalToConstant: ((self.gameViewFrame?.width ?? 0) / 2) - 40),
            self.btnRight.heightAnchor.constraint(equalToConstant: (self.gameViewFrame?.height ?? 0) * 0.1)
        ])

    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
        self.btnUp.backgroundColor = self.setupButtonColor(allowedButton: self.allowedMovimentations?.up ?? false)
        self.btnDown.backgroundColor = self.setupButtonColor(allowedButton: self.allowedMovimentations?.down ?? false)
        self.btnLeft.backgroundColor = self.setupButtonColor(allowedButton: self.allowedMovimentations?.left ?? false)
        self.btnRight.backgroundColor = self.setupButtonColor(allowedButton: self.allowedMovimentations?.right ?? false)
    }
}

//MARK: - Functions here
extension GameButtons {
    
    func setup(allowedMovimentations: (up: Bool, down: Bool, left: Bool, right: Bool)) {
        self.allowedMovimentations = allowedMovimentations
        self.setupViewConfiguration()
    }
    
    func setupButtonColor(allowedButton: Bool) -> UIColor {
        if allowedButton {
            return .blue
        } else {
            return .gray
        }
    }
    
    @objc func btnUpAction() {
        if (self.allowedMovimentations?.up ?? false) {
            self.gameMovimentationsDelegate?.didMoveUp()
        }
    }
    @objc func btnDownAction() {
        if (self.allowedMovimentations?.down ?? false) {
            self.gameMovimentationsDelegate?.didMoveDown()
        }
        
    }
    @objc func btnLeftAction() {
        if (self.allowedMovimentations?.left ?? false) {
            self.gameMovimentationsDelegate?.didMoveToLeft()
        }
    }
    @objc func btnRightAction() {
        if (self.allowedMovimentations?.right ?? false) {
            self.gameMovimentationsDelegate?.didMoveToRight()
        }
    }
}
