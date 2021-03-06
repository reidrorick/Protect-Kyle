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
    var menuPic=SKSpriteNode(imageNamed: "menu")
    
    //LabelNodes
    var roundLabel = SKLabelNode(fontNamed: "Chalkduster")
    var roundLabel2 = SKLabelNode(fontNamed: "Chalkduster")
    var scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
    var upgrade1Label = SKLabelNode(fontNamed: "Chalkduster")
    var upgrade2Label = SKLabelNode(fontNamed: "Chalkduster")
    var upgrade3Label = SKLabelNode(fontNamed: "Chalkduster")
    var healthLabel = SKLabelNode(fontNamed: "Chalkduster")
    var healthNumb = SKLabelNode(fontNamed: "Chalkduster")
    var upgradeLabel = SKLabelNode(fontNamed: "Chalkduster")
    var introLabel1 = SKLabelNode(fontNamed: "ChalkDuster")
    var introLabel2 = SKLabelNode(fontNamed: "ChalkDuster")
    var introLabel3 = SKLabelNode(fontNamed: "ChalkDuster")
    var gameOverLabel = SKLabelNode(fontNamed: "Chalkduster")
    
    
    //CameraNode
    var myCamera:SKCameraNode?
   
    //Booleans
    var rightPressed:Bool=false
    var leftPressed:Bool=false
    var mousePressed:Bool=false
    var upgrade1:Bool=false
    var timee:Bool=false
    var ready:Bool=false
    var cheater:Bool=false
    var gameOver:Bool=false
    var gamePaused:Bool=false
    var alreadyBought1=false
    var alreadyBought2=false
    var alreadyBought3=false
    var upgrade2:Bool=false
    var healthUpgrade:Bool=false
    
    //Int
    var zombieNumb:Int=0
    var roundNumb:Int=0
    var scoreInt:Int=0
    var zombieCounter:Int=0
    var menuNumb:Int=0
    var gotHit:Int=0
    var health:Int=100
    
    //CGFloats
    var timer:CGFloat=0
    var timer2:CGFloat=0
    var relativeDist:CGFloat=0
    var zombieCount:CGFloat=15
    var zNumb:CGFloat=0
    var score:CGFloat=0
    
    
    //
    let zombie=ZombieClass()
    var theView:SKView?
    
    
    override func didMove(to view: SKView) {
        
        theView=view
        myCamera=SKCameraNode()
        self.camera=myCamera
        addChild(myCamera!)
        
        // Create a tracking area object with self as the owner (i.e., the recipient of mouse-tracking messages
        let trackingArea = NSTrackingArea(rect: view.frame, options: [.activeInKeyWindow, .mouseMoved], owner: self, userInfo: nil)
        // Add the tracking area to the view
        view.addTrackingArea(trackingArea)
        
        //Platty
        addChild(platty)
        platty.zPosition = 2
        platty.setScale(0.5)
        platty.position.x = -background.size.width
       
        //Background1
        addChild(background)
        background.setScale(1)
        background.zPosition = 1
        
        //Background2
        addChild(background2)
        background2.setScale(1)
        background2.zPosition = 1
        background2.position.x = background.size.width
        
        //Background3
        addChild(background3)
        background3.setScale(1)
        background3.zPosition = 1
        background3.position.x = background.size.width*2
        
        //Background4
        addChild(background4)
        background4.setScale(1)
        background4.zPosition = 1
        background4.position.x = background.size.width*3
        
        //Background5
        addChild(background5)
        background5.setScale(1)
        background5.zPosition = 1
        background5.position.x = background.size.width*4
        
        // Background6
        addChild(background6)
        background6.setScale(1)
        background6.zPosition = 1
        background6.position.x = background.size.width*5
        addChild(platty2)
        platty2.zPosition = 2
        platty2.setScale(0.5)
        platty2.position.x = background.size.width*5
        
        //Backgroundloop
        addChild(backgroundLoop)
        backgroundLoop.zPosition = 1
        backgroundLoop.position.x = -background.size.width
        
        //Target
        addChild(target)
        target.zPosition = 3.5
        target.setScale(0.05)
        
        //RoundLabel1
        roundLabel.position.y = size.height/2 - 50
        roundLabel.position.x = 400
        roundLabel.fontColor = NSColor.blue
        roundLabel.zPosition = 10
        roundLabel.fontSize=26
        myCamera!.addChild(roundLabel)
        
        //RoundLabel2
        roundLabel2.position.y = size.height/2 - 90
        roundLabel2.position.x = 400
        roundLabel2.fontColor = NSColor.blue
        roundLabel2.zPosition = 10
        roundLabel2.fontSize=32
        myCamera!.addChild(roundLabel2)
        
        //ScoreLabel
        scoreLabel.position.y = size.height/2 - 80
        scoreLabel.fontColor = NSColor.blue
        scoreLabel.zPosition = 10
        scoreLabel.fontSize=32
        myCamera!.addChild(scoreLabel)
        
        //MenuPic
        menuPic.xScale = 1.5
        menuPic.yScale = 1.25
        menuPic.alpha = 0.5
        menuPic.zPosition = 30
        addChild(menuPic)
        menuPic.isHidden = true
        
        //HealthUpgrade
        upgradeLabel.text = "Press 0 to refill your health - 300"
        upgradeLabel.position.y = 234
        upgradeLabel.position.x = menuPic.position.x
        upgradeLabel.fontColor = NSColor.red
        upgradeLabel.zPosition = 31
        upgradeLabel.fontSize = 30
        addChild(upgradeLabel)
        upgradeLabel.isHidden = true
        
        //Upgrade 1 Label
        upgrade1Label.text = "Press 1 to upgrade your gun to fully automatic - 500"
        upgrade1Label.position.y = upgradeLabel.position.y - 50
        upgrade1Label.position.x = menuPic.position.x
        upgrade1Label.fontColor = NSColor.red
        upgrade1Label.zPosition = 31
        upgrade1Label.fontSize = 28
        addChild(upgrade1Label)
        upgrade1Label.isHidden = true
        
        //Upgrade 2 Label
        upgrade2Label.text = "Press 2 to upgrade your turn speed - 1000"
        upgrade2Label.position.y = upgrade1Label.position.y - 50
        upgrade2Label.position.x = menuPic.position.x
        upgrade2Label.fontColor = NSColor.red
        upgrade2Label.zPosition = 31
        upgrade2Label.fontSize = 30
        addChild(upgrade2Label)
        upgrade2Label.isHidden = true
        
        //healthLabel
        healthLabel.text = "Health:"
        healthLabel.position.y = roundLabel.position.y
        healthLabel.position.x = -400
        healthLabel.fontColor = NSColor.blue
        healthLabel.zPosition = 31
        healthLabel.fontSize = 30
        myCamera!.addChild(healthLabel)
        
        //healthNumb
        healthNumb.position.y = roundLabel2.position.y
        healthNumb.position.x = -400
        healthNumb.fontColor = NSColor.blue
        healthNumb.zPosition = 31
        healthNumb.fontSize = 30
        myCamera!.addChild(healthNumb)
        
        //
        introLabel1.text = "Press R to start the round!"
        introLabel1.position.y = 250
        introLabel1.fontColor = NSColor.blue
        introLabel1.zPosition = 30
        addChild(introLabel1)
        
        introLabel2.text = "Press N to access the menu between rounds!"
        introLabel2.position.y = 200
        introLabel2.fontColor = NSColor.blue
        introLabel2.zPosition = 30
        addChild(introLabel2)
        
        introLabel3.text = "Press M to get out of the menu"
        introLabel3.position.y = 150
        introLabel3.fontColor = NSColor.blue
        introLabel3.zPosition = 30
        addChild(introLabel3)
        
        gameOverLabel.text = "You Lose!"
        gameOverLabel.position.y = 150
        gameOverLabel.fontColor = NSColor.red
        gameOverLabel.zPosition = 40
        gameOverLabel.fontSize = 40
        addChild(gameOverLabel)
        gameOverLabel.isHidden = true
        
        
        
        
        
        
        
        
       
        
        
        
        
        
        
        
        
        

        
       
        
        
        
        
        
        
        
        
       

       
    }//didMove
    

    
    func touchDown(atPoint pos : CGPoint) {
        for x in nodes(at: pos)
        {
            if x.name != nil
            {
                if x.name!.contains("Zombie")
                {
                    let roundNumber = CGFloat(roundNumb)
                    for thisNode in self.children
                    {
                        if thisNode.name != nil
                        {
                            if thisNode.name! == x.name!
                            {
                                thisNode.removeFromParent()
                                score += 5 + 0.5 * roundNumber
                            }//remove
                        }//!=nil
                    }//thisnode
                    x.removeFromParent()
                    score += 5 + 0.5 * roundNumber
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
        if gameOver == false
        {
            self.touchMoved(toPoint: event.location(in: self))
            target.position=event.location(in: self)
        }
        
        
    }
    
    override func mouseUp(with event: NSEvent) {
        self.touchUp(atPoint: event.location(in: self))
        
    }
    
    override func mouseMoved(with event: NSEvent) {
        if gameOver == false
        {
           target.position=event.location(in: self)
        }
        
        //print(target.position)
    }
    
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        //A
        case 0:
            leftPressed=true
        //D
        case 2:
            rightPressed=true
        //S
        case 1:
            print(myCamera!.position.x)
        case 5:
            score += 250
        //E
        case 14:
            if cheater==false
            {
                cheater=true
                timer=0
            }
        //R
        case 15:
            
            if zombieCounter < 2 && ready == false
            {
                introLabel1.isHidden = true
                introLabel2.isHidden = true
                introLabel3.isHidden = true
                ready=true
                roundNumb += 1
                print("Round Number:\(roundNumb)")
                timer2=0
                alreadyBought3 = false
            }
        //T
        case 17:
            roundNumb+=1
        //N
        case 45:
            if gamePaused==false
            {
                introLabel1.isHidden = true
                introLabel2.isHidden = true
                introLabel3.isHidden = true
                gamePaused=true
            }
        //M
        case 46:
            if gamePaused==true
            {
                gamePaused=false
            }
        //1
        case 18:
            if alreadyBought1 == false && score > 499 && gamePaused == true
            {
                upgrade1 = true
            }
        //2
        case 19:
            if alreadyBought2 == false && gamePaused == true && score > 999
            {
                upgrade2 = true
            }
        case 29:
            if alreadyBought3 == false && gamePaused == true && score > 299
            {
                healthUpgrade = true
                health = 100
            }
            
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }//Key Down
    override func keyUp(with event: NSEvent) {
        switch event.keyCode {
        //A
        case 0:
            leftPressed=false
        //D
        case 2:
            rightPressed=false
        //E
        case 14:
            if cheater==true
            {
                cheater=false
            }
            
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }//Key Up
    
    func moveCamera()
    {
        if rightPressed == true && upgrade2 == false
        {
            myCamera!.position.x += 15
        }
        if rightPressed == true && upgrade2 == true
        {
            myCamera!.position.x += 25
        }
        if leftPressed == true && upgrade2 == false
        {
            myCamera!.position.x -= 15
        }
        if leftPressed == true && upgrade2 == true
        {
            myCamera!.position.x -= 25
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
        
        let zombieSpeed:Int = 20/roundNumb
        
        let actions = SKAction.sequence([SKAction.moveTo(y: -size.height/2-tempZombie.size.height, duration: TimeInterval(zombieSpeed))])
        
        let scale = SKAction.sequence([SKAction.scale(to: 2, duration: TimeInterval(zombieSpeed))])
        tempZombie.run(actions, withKey: "actions")
        tempZombie.run(scale, withKey: "scale")
        
        if tempZombie.position.x >= background.size.width*5 - background.size.width/2
            {
                
                let temp2Zombie = zombie.zombieSprite.copy() as! SKSpriteNode
                temp2Zombie.position=temp2Zombie.position
                temp2Zombie.setScale(tempZombie.xScale)
                temp2Zombie.name="Zombie\(zNumb)"
                
                temp2Zombie.zPosition = 3
                addChild(temp2Zombie)
                
                temp2Zombie.position.x = tempZombie.position.x - background.size.width*6
                let actions2 = SKAction.sequence([SKAction.moveTo(y: -size.height/2-temp2Zombie.size.height, duration: TimeInterval(zombieSpeed)),SKAction.removeFromParent()])
                let scale2 = SKAction.sequence([SKAction.scale(to: 2, duration: TimeInterval(zombieSpeed))])
                temp2Zombie.run(scale2, withKey:"scale")
                temp2Zombie.run(actions2, withKey:"actions")
                
                
                
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
                    zombieCounter = counter
                    print("Counter:\(counter)")
                }
            }
        }//zombies on screen counter
        
        
        if zNumb < zombieCount && ready == true
        {
            spawnZombies()
            //print(zNumb)
        }
        else if counter < 2 && ready == true && timer == 0
        {
            if roundNumb < 7
            {
                zombieCount += 5
                timer = 15
                zNumb = 0
                ready = false
            }
            if roundNumb > 7 && roundNumb < 15
            {
                zombieCount += zombieCount*1.25
                timer = 15
                zNumb = 0
                ready = false
            }
            if roundNumb > 15 && roundNumb < 25
            {
                zombieCount += zombieCount*1.5
                timer = 15
                zNumb = 0
                ready = false
            }
            
            
            //print("Timer:\(timer)")
            
        }
        
    }//rounds()
    
    func time()
    {
        
        if timer < 0
        {
            timer = 0
        }
        if timer > 0
        {
            if timer < 0
            {
                timer = 0
            }
        }
        //print("Timer:\(timer)")
    }//time func
    
    func updateLabels()
    {
        //RoundLabel
        roundLabel.text = "Round #"
        
        //RoundLabel2
        roundLabel2.text = "\(roundNumb)"
        
        //Score
        scoreInt = Int(score)
        scoreLabel.text = "Score: \(scoreInt)"
        
        //HealthLabel
        healthNumb.text = "\(health)%"
        
    }
    func updateGameState()
    {
        if gameOver == false && gamePaused == false
        {
            time()
            moveCamera()
            rounds()
            changeHealth()
        }
        if health == 0
        {
            gameOver = true
            if gameOver == true
            {
                gameOverLabel.isHidden = false
            }
        }
        
        if gamePaused == true && gameOver == false
        {
            menuPic.position.x = myCamera!.position.x
            menuPic.isHidden = false
            upgrade1Label.position.x = myCamera!.position.x
            upgrade1Label.isHidden = false
            upgrade2Label.isHidden = false
            upgrade2Label.position.x = myCamera!.position.x
            upgradeLabel.position.x = myCamera!.position.x
            upgradeLabel.isHidden = false
            
        }
        if gamePaused == false && gameOver == false
        {
            menuPic.isHidden = true
            upgrade1Label.isHidden = true
            upgrade2Label.isHidden = true
            upgradeLabel.isHidden = true
        }
        
    }//GameState
    

    

    func changeHealth()
    {
        health -= gotHit
    }//Health & Gameover
    
    func upgradeScore()
    {
        if score > 299
        {
            if alreadyBought3 == false
            {
                upgradeLabel.fontColor = NSColor.black
                if healthUpgrade == true
                {
                    score -= 300
                    upgradeLabel.fontColor = NSColor.yellow
                    alreadyBought3 = true
                    
                }
            }
        }
        if score > 499
        {
            if alreadyBought1 == false
            {
                upgrade1Label.fontColor = NSColor.black
                if upgrade1 == true
                {
                    score -= 500
                    upgrade1Label.fontColor = NSColor.yellow
                    alreadyBought1 = true
                }
            }
        }
        if score > 999
        {
            if alreadyBought2 == false
            {
                upgrade2Label.fontColor = NSColor.black
                if upgrade2 == true
                {
                    score -= 1000
                    upgrade2Label.fontColor = NSColor.yellow
                    alreadyBought2 = true
                }
            }
        }
    }//upgradeScore
 


    
    
    
    
    override func update(_ currentTime: TimeInterval) {
        for zombie in self.children
        {
            if zombie.name != nil
            {
                if zombie.name!.contains("Zombie")
                {
                   if zombie.action(forKey: "actions") == nil && timer2 > 1.5
                   {
                        print("Got Hit: \(gotHit)")
                        health -= 10
                        zombie.removeFromParent()
                    print("name: \(zombie.name!)")
                    }
                }
            }
        }//Health?
        timer = timer - 1/60

        
        timer2 += 1/60

        //print("Counter: \(counter)")
        updateLabels()
        upgradeScore()
        updateGameState()
        // Called before each frame is rendered
        
    }
}

