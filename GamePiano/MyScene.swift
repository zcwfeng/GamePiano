//
//  MyScene.swift
//  TestGame
//
//  Created by zcw on 2018/4/13.
//  Copyright © 2018年 zcw. All rights reserved.
//

import UIKit
import SpriteKit
class MyScene: SKScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let scene = GameScene(size: CGSize.init(width: (self.view?.frame.size.width)!, height: (self.view?.frame.size.height)!))
        scene.scaleMode = SKSceneScaleMode.aspectFill
        self.view?.presentScene(scene)
        
    }
    
    
    

}
