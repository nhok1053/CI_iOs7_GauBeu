//
//  GameScene.swift
//  Session3
//
//  Created by Admin on 3/6/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let playerNode = SKSpriteNode(imageNamed: "player-1.png")
    let enemyNode1 = SKSpriteNode(imageNamed: "fly-1-1.png")
    let enemyNode2 = SKSpriteNode(imageNamed: "fly-2-1.png")
    let enemyNode3 = SKSpriteNode(imageNamed: "fly-3-1.png")
    let playerBullet = SKSpriteNode(imageNamed: "bullet-1.png")
    let enemyBullet = SKSpriteNode(imageNamed: "bullet-2.png")
    let SCENE_MARGIN : CGFloat = 20
    let player_bottom = 50
    let fly_top = 100
    let flyWidth : CGFloat = 28
    let flySpace : CGFloat = 10
    var  firstLocation = UITouch()
    var flyY : CGFloat = 0
    var startTime : TimeInterval = 0
    var startTime2 : TimeInterval = 0
    override func didMove(to view: SKView) {
        anchorPoint = CGPoint(x : 0, y :0)
        conficPhysics()
        addPlayer()
        addFlies(flyX: 100, enemyNode: enemyNode1)
        addFlies(flyX: 300, enemyNode: enemyNode3)
        
    }
    
    func conficPhysics() -> Void {
        self.physicsWorld.gravity = CGVector(dx: 0, dy:0)
    }
    
    func addPlayer()->Void{
        playerNode.anchorPoint = CGPoint(x: 0.5, y: 0)
        playerNode.position = CGPoint(x: self.size.width / 2, y: SCENE_MARGIN)
        playerNode.physicsBody = SKPhysicsBody(rectangleOf: playerNode.size)
        addChild(playerNode)
    }
    func addFlies(flyX : CGFloat , enemyNode : SKSpriteNode ) ->Void{
        enemyNode.anchorPoint = CGPoint(x : 0.5 , y : 1)
        enemyNode.position = CGPoint(x: flyX, y: self.size.height)
        enemyNode.physicsBody = SKPhysicsBody(rectangleOf: enemyNode1.size)
        enemyNode.physicsBody?.collisionBitMask = 0
        enemyNode.physicsBody?.velocity = CGVector(dx : 0, dy : -20)
        enemyNode.physicsBody?.linearDamping = 0
        enemyNode.physicsBody?.mass = 0
        addChild(enemyNode)
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let  firstLocation = touches.first {
            let location = firstLocation.location(in: self)
            print(location)
            playerNode.position.x = location.x
        }
    }
    func playerShoot(playerBulletX : CGFloat , playerBulletY : CGFloat) -> Void {
        let bulletPlayerNode = SKSpriteNode(imageNamed: "bullet-1.png")
        bulletPlayerNode.position = CGPoint(x: playerBulletX, y: playerBulletY)
        bulletPlayerNode.physicsBody = SKPhysicsBody(rectangleOf: bulletPlayerNode.size)
        bulletPlayerNode.physicsBody?.collisionBitMask = 0
        bulletPlayerNode.physicsBody?.velocity = CGVector(dx: 0, dy : 300)
        bulletPlayerNode.physicsBody?.linearDamping = 0
        bulletPlayerNode.physicsBody?.mass = 0
        addChild(bulletPlayerNode)
    }
    func fliesShoot(fliesBulletX : CGFloat, fliesBulletY : CGFloat) -> Void{
        let bulletFilesNode = SKSpriteNode(imageNamed: "bullet-2.png")
        bulletFilesNode.position = CGPoint(x : fliesBulletX, y : fliesBulletY)
        bulletFilesNode.physicsBody = SKPhysicsBody(rectangleOf: bulletFilesNode.size)
        bulletFilesNode.physicsBody?.collisionBitMask = 0
        bulletFilesNode.physicsBody?.velocity = CGVector(dx: 0, dy : -300)
        bulletFilesNode.physicsBody?.linearDamping = 0
        bulletFilesNode.physicsBody?.mass = 0
        addChild(bulletFilesNode)
    }
    override func update(_ currentTime: TimeInterval) {
        
        
        if currentTime - startTime2 > 1.5 {
            fliesShoot(fliesBulletX: enemyNode1.position.x, fliesBulletY: enemyNode1.position.y - enemyNode1.size.height)
            fliesShoot(fliesBulletX: enemyNode3.position.x, fliesBulletY: enemyNode3.position.y - enemyNode3.size.height)
            startTime2 = currentTime
            
        }
        if currentTime - startTime > 0.2 {
            playerShoot(playerBulletX: playerNode.position.x, playerBulletY: playerNode.position.y + playerNode.size.height)
            startTime = currentTime
        }
        
        
    }
}
