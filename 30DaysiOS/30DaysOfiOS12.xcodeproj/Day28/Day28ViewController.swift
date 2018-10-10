//
// Day28ViewController
// 30DaysOfiOS12
//
// Created by DevTechie Interactive on 10/6/18.
// Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit
import ARKit

class Day28ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addCube()
        self.title = "ARKit"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let config = ARWorldTrackingConfiguration()
        sceneView.session.run(config)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        sceneView.session.pause()
        super.viewWillDisappear(animated)
    }
    
    func addCube() {
        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.001)
        let node = SCNNode()
        node.geometry = cube
        node.position = SCNVector3Make(0, 0, -0.5)
        let scene = SCNScene()
        scene.rootNode.addChildNode(node)
        sceneView.scene = scene
    }
}
