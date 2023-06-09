//
//  ResultController.swift
//  teste-case-labyrinth-game
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 09/06/23.
//

import UIKit

class ResultController: UIViewController {
    var gameVCDismissAction: (() -> Void)?
    
    lazy private var resultView = ResultView(frame: self.view.frame)
    
    override func loadView() {
        super.loadView()
        self.view = resultView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .done, target: self, action: #selector(self.closeVC))
        self.navigationItem.hidesBackButton = true
        self.navigationItem.rightBarButtonItem = navItem
    }
}

//MARK: - Functions here
extension ResultController {
    @objc func closeVC() {
        self.navigationController?.popViewController(animated: false)
        (self.gameVCDismissAction ?? {print("error: back to initial page from result page")})()
    }
}


