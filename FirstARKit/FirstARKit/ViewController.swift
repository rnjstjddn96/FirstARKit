//
//  ViewController.swift
//  FirstARKit
//
//  Created by imform-mm-2101 on 2021/11/24.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    let arView: ARView = {
        let arView = ARView()
        arView.cameraMode = .ar
        arView.automaticallyConfigureSession = true
        arView.translatesAutoresizingMaskIntoConstraints = false
        return arView
    }()
    
    let currnetAnchorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.backgroundColor = .black
        label.text = "asdawdnwalidnaskdnawloidnaw"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        self.setConstraints()
    }
    
    private func setUI() {
        self.view.addSubview(arView)
        self.arView.addSubview(currnetAnchorLabel)
        currnetAnchorLabel.layer.zPosition = 100
        setARView()
    }
    
    private func setConstraints() {
        arView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        arView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        arView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        arView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        currnetAnchorLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        currnetAnchorLabel.bottomAnchor.constraint(equalTo: self.arView.bottomAnchor).isActive = true
        currnetAnchorLabel.leadingAnchor.constraint(equalTo: self.arView.leadingAnchor).isActive = true
        currnetAnchorLabel.trailingAnchor.constraint(equalTo: self.arView.trailingAnchor).isActive = true
    }
    
    private func setARView() {
        guard let drumAnchor = try? Experience.loadDrum() else { return }
        arView.scene.addAnchor(drumAnchor)
//        let tap = UITapGestureRecognizer(target: self, action: #selector(changeScene))
//        self.arView.addGestureRecognizer(tap)
    }
    
    @objc func changeScene() {
        arView.scene.anchors.removeAll()
        
        guard let drumAnchor = try? Experience.loadDrum() else { return }
//        guard let foodAnchor = try? Experience.loadFood() else { return }
        
        arView.scene.addAnchor(drumAnchor)
        
//        if arView.scene.anchors.contains(where: { anchor in
//            return anchor == drumAnchor
//        }) {
//            arView.scene.addAnchor(foodAnchor)
//            self.currnetAnchorLabel.text = "FoodAnchor"
//        } else {
//            arView.scene.anchors.append(drumAnchor)
//            self.currnetAnchorLabel.text = "drumAnchor"
//        }
    }
    
}
