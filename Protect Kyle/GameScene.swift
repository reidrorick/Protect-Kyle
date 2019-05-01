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
    

    //SpriteNodes
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
    var gun=SKSpriteNode(imageNamed: "Scar")
    var target=SKSpriteNode(imageNamed: "target")

    //CameraNode
    var myCamera:SKCameraNode?
   
    //Booleans
    var rightPressed:Bool=false
    var leftPressed:Bool=false
    var mousePressed:Bool=false
    var upgrade1:Bool=false
    
    //Int
    var zombieNumb:Int=0
    
    //CGFloats
    var timer:CGFloat=0
    var relativeDist:CGFloat=0
    var zombieCount:CGFloat=30
    var zNumb:CGFloat=0
    
    //
    let zombie=ZombieClass()
    var theView:SKView?
    
    
    override func didMove(to view: SKView) {
        
        theView=view
        
        // Create a tracking area object with self as the owner (i.e., the recipient of mouse-tracking messages
        let trackingArea = NSTrackingArea(rect: view.frame, options: [.activeInKeyWindow, .mouseMoved], owner: self, userInfo: nil)
        // Add the tracking area to the view
        view.addTrackingArea(trackingArea)
        
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
        
        
        
        addChild(target)
        target.zPosition = 3.5
        target.setScale(0.05)
        
        
        
        
        
        
        
        

        
       
        
        
        
        
        
        
        
        
       
        myCamera=SKCameraNode()
        self.camera=myCamera
        addChild(myCamera!)
       
    }//didMove
    

    
    func touchDown(atPoint pos : CGPoint) {
        for x in nodes(at: pos)
        {
            if x.name != nil
            {
                if x.name!.contains("Zombie")
                {
                    for thisNode in self.children
                    {
                        if thisNode.name != nil
                        {
                            if thisNode.name! == x.name!
                            {
                                
                                thisNode.removeFromParent()
                            }//remove
                        }//!=nil
                    }//thisnode
                    x.removeFromParent()
                }//kill zombie
            }//!=nil
        }//for loop
    }//touchdown
    
    func touchMoved(toPoint pos : CGPoint) {
        if upgrade1==true
        {
            for x in nodes(at: pos)
            {
                if x.name != nil
                {
                    if x.name!.contains("Zombie")
                    {
                        for thisNode in self.children
                        {
                            if thisNode.name != nil
                            {
                                if thisNode.name! == x.name!
                                {
                                    
                                    thisNode.removeFromParent()
                                }//remove
                            }//!=nil
                        }//thisnode
                        x.removeFromParent()
                        zombieNumb += 1
                    }//kill zombie
                }//!=nil
            }//for loop
        }
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        mousePressed=false
    }
    
    override func mouseDown(with event: NSEvent) {
        self.touchDown(atPoint: event.location(in: self))
        
    }//mouse down
    
    override func mouseDragged(with event: NSEvent) {
        self.touchMoved(toPoint: event.location(in: self))
        target.position=event.location(in: self)
        
    }
    
    override func mouseUp(with event: NSEvent) {
        self.touchUp(atPoint: event.location(in: self))
        
    }
    
    override func mouseMoved(with event: NSEvent) {
        target.position=event.location(in: self)
        print(target.position)
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
        let tempZombie = zombie.zombieSprite.copy() as! SKSpriteNode
        let zombieSize = 20/relativeDist
        relativeDist = -size.height/2 - tempZombie.position.y
        tempZombie.setScale(zombieSize)
        tempZombie.name="Zombie\(zNumb)"
        tempZombie.position.x = random(min: -background.size.width/2, max: background.size.width*5 + background.size.width/2)
        tempZombie.position.y = 0
        addChild(tempZombie)
        
        tempZombie.zPosition = 3
        
        let actions = SKAction.sequence([SKAction.moveTo(y: -size.height/2-tempZombie.size.height, duration: 10),SKAction.removeFromParent()])
        
        let scale = SKAction.sequence([SKAction.scale(to: 2, duration: 10)])
        tempZombie.run(actions)
        tempZombie.run(scale)
        
        if tempZombie.position.x >= background.size.width*5 - background.size.width/2
            {
                
                let temp2Zombie = zombie.zombieSprite.copy() as! SKSpriteNode
                temp2Zombie.position=temp2Zombie.position
                temp2Zombie.setScale(tempZombie.xScale)
                temp2Zombie.name="Zombie\(zNumb)"
                
                temp2Zombie.zPosition = 3
                addChild(temp2Zombie)
                
                temp2Zombie.position.x = tempZombie.position.x - background.size.width*6
                let actions2 = SKAction.sequence([SKAction.moveTo(y: -size.height/2-temp2Zombie.size.height, duration: 10),SKAction.removeFromParent()])
                let scale2 = SKAction.sequence([SKAction.scale(to: 2, duration: 10)])
                temp2Zombie.run(scale2)
                temp2Zombie.run(actions2)
                
                
                
            }//copy zombie
            tempZombie.name = "Zombie\(zNumb)"
            zNumb += 1
        
        }//spawn zombies
    func rounds()
    {
        var counter:Int=0
        for node in children
        {
            if node.name != nil
            {
                if node.name!.contains("Zombie")
                {
                    counter += 1
                }
            }
        }//zombies on screen counter
        
        
        if zNumb < zombieCount && timer ==  0
        {
            spawnZombies()
            print(zNumb)
        }
        else if zNumb == zombieCount
        {
            zombieCount = 1.5*zombieCount
            timer += 15
        }
    }//rounds()
            
    
        
        
    
    

    
    
    
    
    override func update(_ currentTime: TimeInterval) {
            moveCamera()
            rounds()
        // Called before each frame is rendered
    }
}

