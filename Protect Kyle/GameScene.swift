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
    var background2=SKSpriteNode(imageNamed: "background2")
    var background3=SKSpriteNode(imageNamed: "background")
    var background4=SKSpriteNode(imageNamed: "background2")
    var background5=SKSpriteNode(imageNamed: "background")
    var background6=SKSpriteNode(imageNamed: "background2")
    var platty=SKSpriteNode(imageNamed: "Platty")
    var platty2=SKSpriteNode(imageNamed: "Platty")
    var platty3=SKSpriteNode(imageNamed: "Platty")
    
    var myCamera:SKCameraNode?
    
    var rightPressed:Bool=false
    var leftPressed:Bool=false
    
    override func didMove(to view: SKView) {
        addChild(platty)
        platty.zPosition = 2
        platty.setScale(0.5)
        addChild(background)
        background.setScale(4.35)
        background.zPosition = 1
        
        addChild(background2)
        background2.setScale(4.35)
        background2.zPosition = 1
        background2.position.x = -1100
        
        addChild(background3)
        background3.setScale(4.35)
        background3.zPosition = 1
        background3.position.x = -2210
        
        addChild(background4)
        background4.setScale(4.35)
        background4.zPosition = 1
        background4.position.x = 1100
        
        addChild(background5)
        background5.setScale(4.35)
        background5.zPosition = 1
        background5.position.x = 2210
        
        addChild(background6)
        background6.setScale(4.35)
        background6.zPosition = 1
        background6.position.x = 3300
        
        addChild(platty2)
        platty2.position.x = 3300
        
        
        
        
       
        myCamera=SKCameraNode()
        self.camera=myCamera
        addChild(myCamera!)
       
    }
    
    
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
        if myCamera!.position.x > 2250
        {
            myCamera!.position.x = -2200
        }
        if myCamera!.position.x < -2200
        {
            myCamera!.position.x = 2200
        }
    } //moveCamera()

    
    
    
    
    override func update(_ currentTime: TimeInterval) {
        moveCamera()
        // Called before each frame is rendered
    }
}
