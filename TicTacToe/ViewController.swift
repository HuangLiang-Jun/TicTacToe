//
//  ViewController.swift
//  TicTacToe
//
//  Created by huang on 2016/12/15.
//  Copyright © 2016年 Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var btnFromSuperView: [UIButton]!
    private var playerOrder = 0
    private var gameEngine = GameEngine()
    let alert = GameCustomView()
    override func viewDidLoad() {
       
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector:#selector(tie) , name: gameEngine.NOTIFICATION_TIE_KEY, object: nil)
        
    }
    
    @IBAction private func playerChoosePointBtnPressed(_ sender: UIButton) {
        
        if playerOrder == 0 {
            
            sender.setImage(#imageLiteral(resourceName: "X"), for: .normal)
            
            sender.isEnabled = false
            let result = gameEngine.victoryFormula(playerOrder: playerOrder, senderTag: sender.tag)
            
            if result {
                
                alert.setup(winerImage: #imageLiteral(resourceName: "X"), winBacKGroundImage: #imageLiteral(resourceName: "blueWin"))
                alert.okBtnPressed.addTarget(self, action: #selector(restart), for: .touchUpInside)
                view.addSubview(alert)
                print("red wing!!" )
            }
            
            playerOrder = 1
        
        } else {
        
            sender.setImage(#imageLiteral(resourceName: "O"), for: .normal)
           
            alert.okBtnPressed.addTarget(self, action: #selector(restart), for: .touchUpInside)
            
            sender.isEnabled = false
            
            let result = gameEngine.victoryFormula(playerOrder: playerOrder, senderTag: sender.tag)
            
            if result {
                
                alert.setup(winerImage: #imageLiteral(resourceName: "O"), winBacKGroundImage: #imageLiteral(resourceName: "redWin"))
                view.addSubview(alert)
                print("black wing!!" )
            
            }
            
            playerOrder = 0
        }
    }
    
    // 平手
    func tie () {
        
        alert.okBtnPressed.addTarget(self, action: #selector(restart), for: .touchUpInside)
        alert.setup(winerImage: #imageLiteral(resourceName: "TieTitle"), winBacKGroundImage: #imageLiteral(resourceName: "Tie"))
        view.addSubview(alert)
    
    }
    
    func restart() {
       
        alert .removeFromSuperview()
        for tmp in self.btnFromSuperView {
        
            tmp.setImage(nil, for: .normal)
            tmp.isEnabled = true
        
        }
        
        playerOrder = 0
        gameEngine = GameEngine()
    }
}

