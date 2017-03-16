//
//  GameCustomView.swift
//  TicTacToe
//
//  Created by huang on 2016/12/18.
//  Copyright © 2016年 Huang. All rights reserved.
//

import UIKit

class GameCustomView: UIView {
    
    //var maskView:UIView
    override init(frame:CGRect) {
        super.init(frame: frame)
        //self.setup()
    }
    // Xib
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        //self.setup()
    }
    
    var okBtnPressed:UIButton = UIButton(frame:CGRect(x: 65, y: 230, width: 120, height: 40))
    
    func setup(winerImage:UIImage,winBacKGroundImage:UIImage){
        // set maskView
        self.frame = UIScreen.main.bounds
        self.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.6)
        
        // create alertView
        let alertView:UIView = UIView(frame:CGRect(x: 0.0, y:0.0, width: 250, height: 300))
        alertView.center = self.center
        alertView.backgroundColor = .clear
        
        //imageView
        let alertBG:UIImageView = UIImageView(image: #imageLiteral(resourceName: "alertBackground"))
        alertBG.frame = CGRect(x: 0.0, y:0.0, width: 250, height: 300)
        
        // create headImageView
        let headImageView:UIImageView = UIImageView(image: winerImage)
        headImageView.frame = CGRect(x: 100, y: 40, width: 49, height: 49)
        
        // create btn
        okBtnPressed.setImage(#imageLiteral(resourceName: "RestartBtn"), for: .normal)
        //okBtnPressed.addTarget(self, action: #selector(GameCustomView.restartBtnPressedReturn), for: .touchUpInside)
        
        // create WinTextImage
        let winImageViwe:UIImageView = UIImageView(image: winBacKGroundImage)
        winImageViwe.frame = CGRect(x: 25, y: 100, width: 200, height:100 )
          
        // add subView
        alertView.addSubview(alertBG)
        alertView.addSubview(winImageViwe)
        alertView.addSubview(headImageView)
        alertView.addSubview(okBtnPressed)
        
        //add alertView
        self.addSubview(alertView)
    }
}
