//
//  Globe3DView.swift
//  Trail Blaze
//
//  Created by Udani Fernando on 11/12/2024.
//

import Foundation
import SwiftUI
import SceneKit
import CoreLocation

struct Globe3DView: UIViewRepresentable {
    @Binding var userLocation: CLLocation?

    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        let scene = SCNScene()
        
        
        let globe = SCNSphere(radius: 1.0)
        if let earthTexture = UIImage(named: "earth_texture") {
            let material = SCNMaterial()
            material.diffuse.contents = earthTexture
            material.isDoubleSided = true
            material.diffuse.wrapS = .repeat
            material.diffuse.wrapT = .clamp
            globe.firstMaterial = material
        }
        
        
        let globeNode = SCNNode(geometry: globe)
        
        scene.rootNode.addChildNode(globeNode)
        
        
        let directionalLight = SCNLight()
        directionalLight.type = .directional
        directionalLight.castsShadow = true
        let directionalLightNode = SCNNode()
        directionalLightNode.light = directionalLight
        directionalLightNode.position = SCNVector3(0, 5, 5)
        directionalLightNode.look(at: globeNode.position)
        scene.rootNode.addChildNode(directionalLightNode)
        
        // Add an ambient light (to provide general light from all directions)
        let ambientLight = SCNLight()
        ambientLight.type = .ambient
        ambientLight.color = UIColor.white.withAlphaComponent(0.3) // Soft light
        let ambientLightNode = SCNNode()
        ambientLightNode.light = ambientLight
        scene.rootNode.addChildNode(ambientLightNode)
        
        
        let camera = SCNCamera()
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(0, 0, 3)
        scene.rootNode.addChildNode(cameraNode)
        
        if let userLocation = userLocation {
            let latitude = userLocation.coordinate.latitude * .pi / 180
            let longitude = userLocation.coordinate.longitude * .pi / 180
            
            let rotationX = Float(latitude)
            let rotationY = Float(longitude)
            
            print("Latitude in radians: \(latitude), Longitude in radians: \(longitude)")
            
            
            globeNode.rotation = SCNVector4(1, 0, 0, -rotationX)
            globeNode.rotation = SCNVector4(0, 1, 0, -rotationY)
            
            let pinNode = SCNNode(geometry: SCNSphere(radius: 0.01))
            pinNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
            
            let x = cos(latitude) * sin(longitude)
            let y = sin(latitude)
            let z = cos(latitude) * cos(longitude)
            
            print("Pin position: x: \(x), y: \(y), z: \(z)")
            
            pinNode.position = SCNVector3(x: Float(x), y: Float(y), z: Float(z))
            
            globeNode.addChildNode(pinNode)
        }
        
        
        sceneView.scene = scene
        sceneView.allowsCameraControl = true
        sceneView.backgroundColor = .clear
        return sceneView
    }

    func updateUIView(_ uiView: SCNView, context: Context) {}
}
