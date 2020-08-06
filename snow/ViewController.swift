//
//  ViewController.swift
//  snow
//
//  Created by Bernice TSAI on 2020/8/6.
//
import SpriteKit
import UIKit

class ViewController: UIViewController {
    func gradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
           CGColor(srgbRed: 1, green: 1, blue: 1, alpha: 1),
           CGColor(srgbRed: 97/255, green: 112/255, blue: 88/255, alpha: 1)
        ]
        view.layer.addSublayer(gradientLayer)
}
    func spriteSnow(){
        let skView = SKView(frame: view.frame)
        view.insertSubview(skView, at: 0)
        let scene = SKScene(size: skView.frame.size)
        scene.anchorPoint = CGPoint(x: 0.5, y: 1)
        let emitterNode = SKEmitterNode(fileNamed: "snow")
        scene.addChild(emitterNode!)
        skView.presentScene(scene)
        
}
    func snowEmitter(particle: String){
        let snowEmitterCell = CAEmitterCell()
        snowEmitterCell.contents = UIImage(named: particle)?.cgImage
        snowEmitterCell.birthRate = 100
        snowEmitterCell.lifetime = 2
        snowEmitterCell.velocity = 600
        snowEmitterCell.scale = 0.1
        snowEmitterCell.scaleRange = 0.05
        snowEmitterCell.yAcceleration = 100
        snowEmitterCell.emissionRange = CGFloat.pi
        snowEmitterCell.spin = 0.5
        snowEmitterCell.spinRange = 1
        let snowEmitterLayer = CAEmitterLayer()
        snowEmitterLayer.emitterCells = [snowEmitterCell]
        snowEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width / 2, y: -50)
        snowEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
        snowEmitterLayer.emitterShape = .rectangle
        view.layer.addSublayer(snowEmitterLayer)
}

    override func viewDidLoad() {
        super.viewDidLoad()
        gradient()
        snowEmitter(particle:"spark")
        snowEmitter(particle:"money")
        
    }
        
        // Do any additional setup after loading the view.
}




