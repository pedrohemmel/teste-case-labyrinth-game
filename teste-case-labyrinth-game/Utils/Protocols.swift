//
//  Protocols.swift
//  teste-case-labyrinth-game
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 08/06/23.
//

import Foundation

protocol HomeStartGameDelegate: AnyObject {
    func didSelectStartButton()
}

protocol GameMovimentationsDelegate: AnyObject {
    func didMoveUp()
    func didMoveDown()
    func didMoveToLeft()
    func didMoveToRight()
}

protocol GameResultDelegate: AnyObject {
    func didBecomeAWinner()
}
