//
//  ViewController.swift
//  ARKit Game
//
//  Created by Nikhil Menon on 2/10/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    // MARK: - Subviews
    let sceneView = ARSCNView()
    
    let scoreLabel:UILabel = {
       let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.backgroundColor = .white
        label.numberOfLines = 0
        label.text = "0"
        return label
    }()
    
    
    // MARK: Subview Constraints
    /// Sets the constraints for subviews
    public func setSubviewConstraints() {
        view.addSubview(sceneView)
        view.addSubview(scoreLabel)
        sceneView.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            // scoreLabel Constraints
            scoreLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scoreLabel.heightAnchor.constraint(equalToConstant: 70),
            
            // sceneView Constraints
            sceneView.topAnchor.constraint(equalTo: view.topAnchor),
            sceneView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sceneView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            sceneView.bottomAnchor.constraint(equalTo: scoreLabel.topAnchor)
        ])
    }
    
    // MARK: - Configure Scene
    /// Configures the SceneView
    private func configureScene() {
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    /// Sets the scene for viewDidLoad
    private func setScene() {
        let scene = SCNScene()
        sceneView.scene = scene
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Call constaint methods
        setSubviewConstraints()
        
        // Configure the Scene View
        setScene()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureScene()
    }


}

