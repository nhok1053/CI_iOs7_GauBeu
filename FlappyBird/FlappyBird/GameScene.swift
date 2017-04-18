//
//  GameScene.swift
//  FlappyBird
//
//  Created by Admin on 3/15/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    let background = SKSpriteNode(imageNamed : "background")
    
    override func didMove(to view: SKView) {
        background.position = CGPoint(x: 0, y: 0)
        addChild(background)
        
           }
    
  
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
