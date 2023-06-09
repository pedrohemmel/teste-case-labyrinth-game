//
//  GameController.swift
//  teste-case-labyrinth-game
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 08/06/23.
//

import UIKit

class GameController: UIViewController {
    private var labyrinthMatrix: [[Int]] = [
        [10, 8, 10, 9],
        [28, 1, 0, 12],
        [12, 10, 9, 13],
        [6, 5, 6, 5]
    ]
    private var currentState = (0, 0)
    private var allowedMovimentations: (up: Bool, down: Bool, left: Bool, right: Bool) = (up: false, down: false, left: false, right: false)
    
    lazy private var gameView = GameView(frame: self.view.frame)
    
    override func loadView() {
        super.loadView()
        self.view = self.gameView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .done, target: self, action: #selector(self.closeVC))
        self.navigationItem.hidesBackButton = true
        self.navigationItem.rightBarButtonItem = navItem
        
        self.currentState = self.getInitialState()
        self.allowedMovimentations = self.verifyMovimentations()
        
        self.gameView.setup(lblNumberOfCurrentState: "\(self.labyrinthMatrix[self.currentState.0][self.currentState.1]) = \(self.changeDecToBin(decNumber: self.labyrinthMatrix[self.currentState.0][self.currentState.1]))")
        
        self.gameView.gameButtons.gameMovimentationsDelegate = self
        self.gameView.gameButtons.setup(allowedMovimentations: self.allowedMovimentations)
        
        self.gameView.gameTableView.gameResultDelegate = self
        self.gameView.gameTableView.setup(labyrinthMatrix: self.labyrinthMatrix, currentState: self.currentState)
    }
}

//MARK: - GameResultDelegate extension
extension GameController: GameResultDelegate {
    func didBecomeAWinner() {
        let newVC = ResultController()
        newVC.gameVCDismissAction = {
            self.navigationController?.popViewController(animated: false)
        }
        self.navigationController?.pushViewController(newVC, animated: true)
    }
}

//MARK: - GameMovimentationsDelegate extension
extension GameController: GameMovimentationsDelegate {
    func didMoveUp() {
        self.currentState.0 = self.currentState.0 - 1
        self.didMoveSetup()
    }
    
    func didMoveDown() {
        self.currentState.0 = self.currentState.0 + 1
        self.didMoveSetup()
    }
    
    func didMoveToLeft() {
        self.currentState.1 = self.currentState.1 - 1
        self.didMoveSetup()
    }
    
    func didMoveToRight() {
        self.currentState.1 = self.currentState.1 + 1
        self.didMoveSetup()
    }
}

//MARK: - Functions here
extension GameController {
    func getInitialState() -> (Int, Int) {
        var initialState = (0, 0)
        for i in 0...(self.labyrinthMatrix.count - 1) {
            for j in 0...(self.labyrinthMatrix[i].count - 1) {
                if self.changeDecToBin(decNumber: self.labyrinthMatrix[i][j]).count > 4 {
                    initialState = (i, j)
                }
            }
        }
        return initialState
    }
    
    func verifyMovimentations() -> (up: Bool, down: Bool, left: Bool, right: Bool) {
        let binNumber = String(self.changeDecToBin(decNumber: self.labyrinthMatrix[self.currentState.0][self.currentState.1]).reversed())
        var newAllowedMovimentations = (up: false, down: false, left: false, right: false)
        
        if binNumber.count > 0 {
            for i in 0...(binNumber.count - 1) {
                if binNumber[binNumber.index(binNumber.startIndex, offsetBy: i)] == "1" {
                    switch i {
                    case 0:
                        if self.currentState.1 > 0 {
                            newAllowedMovimentations.left = true
                        }
                    case 1:
                        if self.currentState.1 < 3 {
                            newAllowedMovimentations.right = true
                        }
                    case 2:
                        if self.currentState.0 > 0 {
                            newAllowedMovimentations.up = true
                        }
                    case 3:
                        if self.currentState.0 < 3 {
                            newAllowedMovimentations.down = true
                        }
                    default:
                        print("process of verifyMovimentations")
                    }
                }
            }
        }
        
        return newAllowedMovimentations
    }
    
    func changeDecToBin(decNumber: Int) -> String {
        var binNumber = ""
        var auxDecNumber = decNumber
        
        while auxDecNumber != 0 {
            if auxDecNumber % 2 == 1 {
                binNumber = "\(binNumber)1"
                auxDecNumber = (auxDecNumber - 1) / 2
            } else {
                binNumber = "\(binNumber)0"
                auxDecNumber = auxDecNumber / 2
            }
            if auxDecNumber == 1 {
                binNumber = "\(binNumber)1"
                auxDecNumber = 0
            } else if auxDecNumber == 0 {
                binNumber = "\(binNumber)0"
            }
        }
        return String(binNumber.reversed())
    }
    
    func didMoveSetup() {
        self.allowedMovimentations = self.verifyMovimentations()
        
        self.gameView.setup(lblNumberOfCurrentState: "\(self.labyrinthMatrix[self.currentState.0][self.currentState.1]) = \(self.changeDecToBin(decNumber: self.labyrinthMatrix[self.currentState.0][self.currentState.1]))")
        
        self.gameView.gameButtons.setup(allowedMovimentations: self.allowedMovimentations)
        self.gameView.gameTableView.setup(labyrinthMatrix: self.labyrinthMatrix, currentState: self.currentState)
    }
    
    @objc func closeVC() {
        self.navigationController?.popViewController(animated: true)
    }
}
