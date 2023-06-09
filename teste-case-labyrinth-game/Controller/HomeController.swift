//
//  HomeController.swift
//  teste-case-labyrinth-game
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 08/06/23.
//

import UIKit

class HomeController: UIViewController {
    lazy private var homeView = HomeView(frame: self.view.frame)
    
    override func loadView() {
        super.loadView()
        self.view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeView.homeStartGameDelegate = self
    }
}

extension HomeController: HomeStartGameDelegate {
    func didSelectStartButton() {
        let newVC = GameController()
        self.navigationController?.pushViewController(newVC, animated: true)
    }
}

