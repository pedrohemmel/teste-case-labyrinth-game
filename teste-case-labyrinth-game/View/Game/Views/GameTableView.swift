//
//  GameTableView.swift
//  teste-case-labyrinth-game
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 08/06/23.
//

import UIKit

class GameTableView: UITableView {
    weak var gameResultDelegate: GameResultDelegate? = nil
    var labyrinthMatrix: [[Int]] = [[Int]()]
    var currentState: (Int, Int) = (0, 0)
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.register(GameTableViewCell.self, forCellReuseIdentifier: "GameTableViewCell")
        self.dataSource = self
        self.delegate = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UITableViewDataSource extension
extension GameTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.labyrinthMatrix.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameTableViewCell") as! GameTableViewCell
        cell.title.text = getRowString(row: indexPath.row, currentState: self.currentState)
        return cell
    }
}

//MARK: - UITableViewDelegate extension
extension GameTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

//MARK: - Functions here
extension GameTableView {
    func setup(labyrinthMatrix: [[Int]], currentState: (Int, Int)) {
        self.labyrinthMatrix = labyrinthMatrix
        self.currentState = currentState
        self.verifyIfBecameAWinner()
        self.reloadData()
    }
    
    func verifyIfBecameAWinner() {
        if labyrinthMatrix[currentState.0][currentState.1] == 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.gameResultDelegate?.didBecomeAWinner()
            }
        }
    }
    
    func getRowString(row: Int, currentState: (Int, Int)) -> String {
        var text = "    "
        for i in 0...(self.labyrinthMatrix[row].count - 1) {
            if row == currentState.0 {
                if i == currentState.1 {
                    text = "\(text)||\(self.labyrinthMatrix[row][i])||    "
                }
                else {
                    text = "\(text)\(self.labyrinthMatrix[row][i])    "
                }
            } else {
                text = "\(text)\(self.labyrinthMatrix[row][i])    "
            }
        }
        return text
    }
}

