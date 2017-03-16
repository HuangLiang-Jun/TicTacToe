//
//  GameEngine.swift
//  TicTacToe
//
//  Created by huang on 2016/12/15.
//  Copyright © 2016年 Huang. All rights reserved.
//

import Foundation

class GameEngine
{
    private let victoryConditions:Array<Set<Int>> = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    private var firstPlayer:Array<Int> = []
    private var secondPlayer:Array<Int> = []
    let NOTIFICATION_TIE_KEY = NSNotification.Name("Tie")
    
    // Save player selected sender & judgment gameRule
    func victoryFormula(playerOrder:Int, senderTag:Int) -> Bool{
        switch playerOrder {
        
        case 0:
        
            firstPlayer.append(senderTag)
            return alignmentMechanism(playerSelected: firstPlayer)
        
        case 1:
        
            secondPlayer.append(senderTag)
            return alignmentMechanism(playerSelected: secondPlayer)
        
        default:
            return false
        }
        
    }
    
    private func alignmentMechanism(playerSelected:Array<Int>) -> Bool{
        
        if playerSelected.count > 2 {
        
            for tmp in victoryConditions {
            
                let result = tmp.intersection(playerSelected)
                if result.count == 3 {
                    return true
                }
            }
            
            if firstPlayer.count + secondPlayer.count == 9{
                
                NotificationCenter.default.post(name: NOTIFICATION_TIE_KEY, object: nil)
                
            }
        }
        return false
    }
    
}
