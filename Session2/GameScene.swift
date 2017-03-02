//
//  GameScene.swift
//  Session2
//
//  Created by Admin on 3/3/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    var locationEnd = CGPoint()
    let playerNode = SKSpriteNode(imageNamed: "player-1.png")
    let enemyNode = SKSpriteNode(imageNamed:"fly-1-1.png")
    let enemyNode2 = SKSpriteNode(imageNamed:"fly-2-1.png")
    let enemyNode3 = SKSpriteNode(imageNamed:"fly-3-1.png")
    let player_bottom = 50
    let enemy_bottom = 100
    let screenSize = UIScreen.main.bounds
    
   
    
    override func didMove(to view: SKView) {
        
        anchorPoint = CGPoint(x: 0.5, y: 0)
        playerNode.anchorPoint = CGPoint(x: 0.5, y: 0)

        let height = (Double(screenSize.height)*2 - Double(screenSize.height)*0.15)
        let width = (Double(screenSize.width)-Double(screenSize.width)*0.4)
        
        print(height)
        print(width)
        
        playerNode.size = CGSize(width: 100, height: 100)
        enemyNode.size = CGSize(width: 100, height: 100)
         enemyNode2.size = CGSize(width: 100, height: 100)
         enemyNode3.size = CGSize(width: 100, height: 100)
        playerNode.position = CGPoint(x: 0 , y: player_bottom)
        enemyNode.position = CGPoint(x: -(width), y: height)
        enemyNode2.position = CGPoint(x: 0, y: height)
        enemyNode3.position = CGPoint(x: (width), y: height)
        addChild(playerNode)
        addChild(enemyNode)
        addChild(enemyNode2)
        addChild(enemyNode3)
        
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let  firstTouch = touches.first {
            let location = firstTouch.location(in: self)
            print(location)
            playerNode.position = location
        }
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        locationEnd = playerNode.position
    }
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
