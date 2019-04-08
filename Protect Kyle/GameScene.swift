//
//  GameScene.swift
//  Protect Kyle
//
//  Created by Game Design Shared on 3/28/19.
//  Copyright © 2019 Game Design Shared. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var background=SKSpriteNode(imageNamed: "background")
    var background2=SKSpriteNode(imageNamed: "background")
    var background3=SKSpriteNode(imageNamed: "background")
    var background4=SKSpriteNode(imageNamed: "background")
    var background5=SKSpriteNode(imageNamed: "background")
    var background6=SKSpriteNode(imageNamed: "background")
    var backgroundLoop=SKSpriteNode(imageNamed: "background")
    var platty=SKSpriteNode(imageNamed: "Platty")
    var platty2=SKSpriteNode(imageNamed: "Platty")
    var platty3=SKSpriteNode(imageNamed: "Platty")
    var zombie=SKSpriteNode(imageNamed: "realLifePatrick")
    
    var myCamera:SKCameraNode?
    
    var rightPressed:Bool=false
    var leftPressed:Bool=false

    
    override func didMove(to view: SKView) {
        addChild(platty)
        platty.zPosition = 2
        platty.setScale(0.5)
        platty.position.x = -background.size.width
       
        addChild(background)
        background.setScale(1)
        background.zPosition = 1
        
        addChild(background2)
        background2.setScale(1)
        background2.zPosition = 1
        background2.position.x = background.size.width
        
        addChild(background3)
        background3.setScale(1)
        background3.zPosition = 1
        background3.position.x = background.size.width*2
        
        addChild(background4)
        background4.setScale(1)
        background4.zPosition = 1
        background4.position.x = background.size.width*3
        
        addChild(background5)
        background5.setScale(1)
        background5.zPosition = 1
        background5.position.x = background.size.width*4
        
        addChild(background6)
        background6.setScale(1)
        background6.zPosition = 1
        background6.position.x = background.size.width*5
        addChild(platty2)
        platty2.zPosition = 2
        platty2.setScale(0.5)
        platty2.position.x = background.size.width*5
        
        
        addChild(backgroundLoop)
        backgroundLoop.zPosition = 1
        backgroundLoop.position.x = -background.size.width
        
        
        
        

        
       
        
        
        
        
        
        
        
        
       
        myCamera=SKCameraNode()
        self.camera=myCamera
        addChild(myCamera!)
       
    }//didMove
    
    
    func touchDown(atPoint pos : CGPoint) {
        
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func mouseDown(with event: NSEvent) {
        self.touchDown(atPoint: event.location(in: self))
    }
    
    override func mouseDragged(with event: NSEvent) {
        self.touchMoved(toPoint: event.location(in: self))
    }
    
    override func mouseUp(with event: NSEvent) {
        self.touchUp(atPoint: event.location(in: self))
    }
    
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case 0:
            leftPressed=true
        case 2:
            rightPressed=true
        case 1:
            print(myCamera!.position.x)
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }//Key Down
    override func keyUp(with event: NSEvent) {
        switch event.keyCode {
        case 0:
            leftPressed=false
        case 2:
            rightPressed=false
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }//Key Up
    func moveCamera()
    {
        if rightPressed==true
        {
            myCamera!.position.x += 15
        }
        if leftPressed==true
        {
            myCamera!.position.x -= 15
        }
        if myCamera!.position.x > background.size.width*5 - 15 && rightPressed == true
        {
            myCamera!.position.x = -background.size.width
        }
        if myCamera!.position.x < -background.size.width + 15 && leftPressed == true
        {
            myCamera!.position.x = background.size.width*5
        }
    } //moveCamera()
    func spawnZombies()
    {
        let tempZombie = zombie.copy() as! SKSpriteNode
        let zombieSize=random(min:0.05, max: 0.15)
        tempZombie.setScale(zombieSize)
        
        tempZombie.position.x = size.width/2+tempZombie.size.width/2
        tempZombie.position.y = size.height/2+tempZombie.size.height/2
        
    }

    
    
    
    
    override func update(_ currentTime: TimeInterval) {
        moveCamera()
        // Called before each frame is rendered
    }
}
