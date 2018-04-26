//
//  GameViewController.swift
//  TestGame
//
//  Created by zcw on 2018/4/12.
//  Copyright © 2018年 zcw. All rights reserved.
//

import UIKit
import SpriteKit
//import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       let scene = GameScene(size: CGSize.init(width: view.frame.size.width, height: view.frame.size.height))
        let skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        scene.scaleMode = SKSceneScaleMode.aspectFill
        skView.presentScene(scene)

//        let mSkView = view as! SKView
//        mSkView.showsFPS = true
//        mSkView.showsNodeCount = true
//        let sceneBoard:SKScene =  SKScene.init(fileNamed: "MyScene.sks")!
//        sceneBoard.scaleMode = SKSceneScaleMode.aspectFill
//        mSkView.presentScene(sceneBoard)
    }

    
}
