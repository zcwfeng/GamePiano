//
//  GameScene.swift
//  TestGame
//
//  Created by zcw on 2018/4/12.
//  Copyright © 2018年 zcw. All rights reserved.
//

import SpriteKit
import GameplayKit
import AudioToolbox

class GameScene: SKScene {
    let label = SKLabelNode(text: "Hello SpriteKit")
    let label1 = SKLabelNode(text: "111")
    let label2 = SKLabelNode(text: "222")
    let label3 = SKLabelNode(text: "333")
    let label4 = SKLabelNode(text: "444")
    let label5 = SKLabelNode(text: "555")
    let label6 = SKLabelNode(text: "666")
    let label7 = SKLabelNode(text: "777")
    var monsters:NSMutableArray
    var projectiles:NSMutableArray
    
    
    var soundID:SystemSoundID = 0
    var soundID2:SystemSoundID = 1
    var soundID3:SystemSoundID = 2
    var soundID4:SystemSoundID = 3
    var soundID5:SystemSoundID = 4
    var soundID6:SystemSoundID = 5
    var soundID7:SystemSoundID = 6
    let fileUrl = NSURL(fileURLWithPath: Bundle.main.path(forResource:"demo/1Gs", ofType: "aif")!)
    let fileUrl2 = NSURL(fileURLWithPath: Bundle.main.path(forResource:"demo/2Gs", ofType: "aif")!)
    let fileUrl3 = NSURL(fileURLWithPath: Bundle.main.path(forResource:"demo/3Gs", ofType: "aif")!)

    let fileUrl4 = NSURL(fileURLWithPath: Bundle.main.path(forResource:"demo/4Gs", ofType: "aif")!)

    let fileUrl5 = NSURL(fileURLWithPath: Bundle.main.path(forResource:"demo/5Gs", ofType: "aif")!)

    let fileUrl6 = NSURL(fileURLWithPath: Bundle.main.path(forResource:"demo/6Gs", ofType: "aif")!)

    let fileUrl7 = NSURL(fileURLWithPath: Bundle.main.path(forResource:"demo/7Gs", ofType: "aif")!)



    
    let projectileSoundEffectAction:SKAction
    override func didMove(to view: SKView) {
//        label.position = CGPoint(x: 100, y: 100)
//        label.fontSize = 45
//        label.name = "GOTOMENU"
//        label.fontColor = SKColor.yellow
//        label.fontName = "Avenir"
//        addChild(label)
        
        
    }
    
    
    func playMusicKey(key:String) -> Void {
        switch key {
        case "1":
            AudioServicesCreateSystemSoundID(fileUrl, &soundID)
            AudioServicesPlayAlertSound(self.soundID)
        case "2":
            AudioServicesCreateSystemSoundID(fileUrl2, &soundID2)
            AudioServicesPlayAlertSound(self.soundID2)
        case "3":
            AudioServicesCreateSystemSoundID(fileUrl3, &soundID3)
            AudioServicesPlayAlertSound(self.soundID3)
        case "4":
            AudioServicesCreateSystemSoundID(fileUrl4, &soundID4)
            AudioServicesPlayAlertSound(self.soundID4)
        case "5":
            AudioServicesCreateSystemSoundID(fileUrl5, &soundID5)
            AudioServicesPlayAlertSound(self.soundID5)
        case "6":
            AudioServicesCreateSystemSoundID(fileUrl6, &soundID6)
            AudioServicesPlayAlertSound(self.soundID6)
        case "7":
            AudioServicesCreateSystemSoundID(fileUrl7, &soundID7)
            AudioServicesPlayAlertSound(self.soundID7)
        default:
           
            break;
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
 
        // 加载文件
//        AudioServicesCreateSystemSoundID(fileUrl, &soundID)
//        AudioServicesCreateSystemSoundID(fileUrl2, &soundID2)
        
        
        
        // 播放短频音效
//        AudioServicesPlayAlertSound(soundID)
//        AudioServicesPlayAlertSound(soundID2)
        
        // 增加震动效果，如果手机处于静音状态，提醒音将自动触发震动
//        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate));
        
        let sp1 = childNode(withName: "1")
        let sp2 = childNode(withName: "2")
        let sp3 = childNode(withName: "3")
        let sp4 = childNode(withName: "4")
        let sp5 = childNode(withName: "5")
        let sp6 = childNode(withName: "6")
        let sp7 = childNode(withName: "7")
        
        for touch in touches  {

            let mLoc = touch.location(in: self)

            let sp = childNode(withName: "GOTOMENU")
            if(sp?.contains(mLoc))! {

                    let sceneBoard:SKScene =  SKScene.init(fileNamed: "MyScene.sks")!
                    sceneBoard.scaleMode = SKSceneScaleMode.aspectFill
                    self.view?.presentScene(sceneBoard)

                    return

            }
            
            
            
            if(sp1?.contains(mLoc))! {
                playMusicKey(key: "1")
               return
            }
                else  if(sp2?.contains(mLoc))! {
                playMusicKey(key: "2")
                return
            }else  if(sp3?.contains(mLoc))! {
                playMusicKey(key: "3")
                return
            }else  if(sp4?.contains(mLoc))! {
                playMusicKey(key: "4")
                return
            }else  if(sp5?.contains(mLoc))! {
                playMusicKey(key: "5")
                return
            }else  if(sp6?.contains(mLoc))! {
                playMusicKey(key: "6")
                return
            }else  if(sp7?.contains(mLoc))! {
                playMusicKey(key: "7")
                return
            }
            
           

            //1 Set up initial location of projectile
            let winSize:CGSize = self.size;
            let projectile:SKSpriteNode = SKSpriteNode.init(imageNamed: "projectile")
            projectile.position = CGPoint(x: projectile.size.width/2, y:winSize.height/2);

            //2 Get the touch location tn the scene and calculate offset
            let location:CGPoint = touch.location(in: self)
            let offset:CGPoint = CGPoint(x:location.x - projectile.position.x, y:location.y - projectile.position.y)

            // Bail out if you are shooting down or backwards
            if (offset.x <= 0) {return}
            // Ok to add now - we've double checked position
            self.addChild(projectile)

            let realX:Int = (Int(winSize.width + (projectile.size.width / 2)))
            let ratio:Float = Float (offset.y /  offset.x )
            let realY:Float = Float(Float(realX) * ratio) + Float(projectile.position.y)
            let realDest:CGPoint = CGPoint(x:realX, y:Int(realY))

            //3 Determine the length of how far you're shooting
            let offRealX:Int = Int(realX) - Int(projectile.position.x)
            let offRealY:Int = Int(realY) - Int(projectile.position.y)
            let length:Int = Int(sqrtf(Float((offRealX * offRealX) + (offRealY * offRealY))))
            let velocity:Int = Int(self.size.width / 1) // projectile speed.
            let realMoveDuration:Int = length/velocity

            //4 Move projectile to actual endpoint
            self.projectiles.add(projectile)

//            projectile.run(SKAction.move(to: realDest, duration: TimeInterval(realMoveDuration))) {
//
//                projectile.removeFromParent()
//            }

            let moveAction:SKAction = SKAction.move(to: realDest, duration: TimeInterval(realMoveDuration))
            let projectileCastAction:SKAction = SKAction.group([moveAction])
            projectile.run(projectileCastAction) {
                projectile.removeFromParent()
                self.projectiles.remove(projectile)
            }



        }
        
        
    }
    let projectileSoundEffectActiont1:SKAction=SKAction.playSoundFileNamed("demo/4Gs.aif", waitForCompletion: false)
//    let projectileSoundEffectActiont2:SKAction=SKAction.playSoundFileNamed("demo/2.aif", waitForCompletion: true)
//    let projectileSoundEffectActiont3:SKAction=SKAction.playSoundFileNamed("demo/3.aif", waitForCompletion: true)
//        let projectileSoundEffectActiont:SKAction=SKAction.playSoundFileNamed("demo/smzy.mp3", waitForCompletion: false)

   
    
    
    override init(size: CGSize) {
        self.monsters = NSMutableArray.init()
        self.projectiles = NSMutableArray.init()
        self.projectileSoundEffectAction = SKAction.playSoundFileNamed("demo/1Gs.aif", waitForCompletion: false)
        
        label.position = CGPoint(x: 200, y: 200)
        label.fontSize = 45
        label.name = "GOTOMENU"
        label.fontColor = SKColor.yellow
        label.fontName = "Avenir"
        
        
        label1.position = CGPoint(x: 100, y: 100)
        label1.fontSize = 15
        label1.name = "1"
        label1.fontColor = SKColor.red
        label1.fontName = "Avenir"
        
        label2.position = CGPoint(x: 150, y: 100)
        label2.fontSize = 15
        label2.name="2"
        label2.fontColor = SKColor.yellow
        label2.fontName = "Avenir"
        
        
        label3.position = CGPoint(x: 200, y: 100)
        label3.fontSize = 15
        label3.name = "3"
        label3.fontColor = SKColor.red
        label3.fontName = "Avenir"
        
        label4.position = CGPoint(x: 250, y: 100)
        label4.fontSize = 15
        label4.name="4"
        label4.fontColor = SKColor.yellow
        label4.fontName = "Avenir"
        
        label5.position = CGPoint(x: 300, y: 100)
        label5.fontSize = 15
        label5.name = "5"
        label5.fontColor = SKColor.red
        label5.fontName = "Avenir"
        
        label6.position = CGPoint(x: 350, y: 100)
        label6.fontSize = 15
        label6.name="6"
        label6.fontColor = SKColor.yellow
        label6.fontName = "Avenir"
        
        
        label7.position = CGPoint(x: 400, y: 100)
        label7.fontSize = 15
        label7.name = "7"
        label7.fontColor = SKColor.red
        label7.fontName = "Avenir"
        
      
        
        
        
        super.init(size: size)
        self.backgroundColor = UIColor.blue

        addChild(label)
        addChild(label1)
        addChild(label2)
        addChild(label3)
        addChild(label4)
        addChild(label5)
        addChild(label6)
        addChild(label7)

        let player = SKSpriteNode.init(imageNamed: "player")
        player.position = CGPoint(x: player.size.width / 2, y: size.height / 2)
        
        
        addChild(player)
        //        addMonster()
        let actionAddMonster = SKAction.run {
            self.addMonster()
        }
        let actionWaintNextMonster = SKAction.wait(forDuration: 1)
        self.run(SKAction.repeatForever(SKAction.sequence([actionAddMonster,actionWaintNextMonster])))
    }
    
    
    func addMonster() {
        let monster:SKSpriteNode = SKSpriteNode.init(imageNamed: "monster")
        // 粒子
//        let emnode  = NSKeyedUnarchiver.unarchiveObject(withFile: "MyScene.sks")
//         // 粒子位置
//        emnode?.position = CGPoint(x: 0, y: 0)
//        // 粒子数量
//        emnode?.numParticlesToEmit = 1
//        // 每个粒子声明周期
//        emnode?.particleLifetime = 10
//        monster.addChild(emnode!)
//        self.addChild(emnode as! SKNode)
        
        let winSize = self.size;
        let minY = monster.size.height / 2
        let maxY = winSize.height - monster.size.height/2
        let rangeY:Int = Int(maxY - minY);
        
        let actualY = ((Int)(arc4random()) % rangeY) + Int(minY)
        monster.position = CGPoint(x: winSize.width + monster.size.width / 2, y: CGFloat(actualY))
        self.addChild(monster)
        
       
        
        let minDuration = 2.0;
        let maxDuration = 4.0;
        let rangeDuration = maxDuration - minDuration;
        let actualDuration = CGFloat(arc4random_uniform(1)) *  CGFloat(rangeDuration) + CGFloat(minDuration)
        
        let actionMove =  SKAction.move(to: CGPoint(x: -monster.size.width / 2, y: CGFloat(actualY)), duration: TimeInterval(actualDuration))
        
       
        
        
        
        
        self.monsters.add(monster)
        
        
        let actionDone = SKAction.run {
            
            monster.removeFromParent()
            self.monsters.remove(monster)

        }
        
        monster.run(SKAction.sequence([actionMove,actionDone]))
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        let projectilesToDelete:NSMutableArray = NSMutableArray.init()
        for projectile in self.projectiles {
            
            let monstersToDelete = NSMutableArray.init()
            for monster in self.monsters {
                
                if ((projectile as! SKSpriteNode).frame.intersects((monster as! SKSpriteNode).frame)) {
                    monstersToDelete.add(monster)
                }
            }
            
            for monster2 in monstersToDelete {
                self.monsters.remove(monster2)
                (monster2 as! SKSpriteNode).removeFromParent()
            }
            
            if (monstersToDelete.count > 0) {
                projectilesToDelete.add(projectile)
            }
        }
        
        for projectile2 in projectilesToDelete {
            self.projectiles.remove(projectile2)
            (projectile2 as! SKSpriteNode).removeFromParent()
        }
        
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
