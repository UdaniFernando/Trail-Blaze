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
    
    @Binding var selectedCountry: Country?
    
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
            
            globeNode.rotation = SCNVector4(1, 0, 0, -rotationX)
            globeNode.rotation = SCNVector4(0, 1, 0, -rotationY)
            
            //            let pinImage = UIImage(named: "country_pin")
            //            let pinGeometry = SCNPlane(width: 0.05, height: 0.05) // Adjust pin size as needed
            //
            //            let pinMaterial = SCNMaterial()
            //            pinMaterial.diffuse.contents = pinImage
            //            pinMaterial.isDoubleSided = true // Ensures visibility from all angles
            //            pinGeometry.materials = [pinMaterial]
            
            let pinNode = SCNNode(geometry: SCNSphere(radius: 0.01))
            pinNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
            
            //            let pinNode = SCNNode(geometry: pinGeometry)
            //            pinNode.constraints = [SCNBillboardConstraint()]
            
            let x = cos(latitude) * sin(longitude)
            let y = sin(latitude)
            let z = cos(latitude) * cos(longitude)
            
            pinNode.position = SCNVector3(x: Float(x), y: Float(y), z: Float(z))
            
            globeNode.addChildNode(pinNode)
        }
        
        
        sceneView.scene = scene
        sceneView.allowsCameraControl = true
        sceneView.backgroundColor = .clear
        return sceneView
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        
        print("Update Globe3D UI View")
        
        print("Selected Country X -- \(selectedCountry)")
        
        guard let country = selectedCountry, let globeNode = context.coordinator.globeNode else { return }
        
        print("Selected Country -- \(country)")
        
        let latitude = country.latitude * .pi / 180
        let longitude = country.longitude * .pi / 180
        
        let x = cos(latitude) * sin(longitude)
        let y = sin(latitude)
        let z = cos(latitude) * cos(longitude)
        
        // Add a pin
        let pinNode = SCNNode(geometry: SCNSphere(radius: 0.01))
        pinNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        pinNode.position = SCNVector3(x: Float(x), y: Float(y), z: Float(z))
        globeNode.addChildNode(pinNode)
        
        // Rotate the globe
//        globeNode.runAction(SCNAction.rotateTo(x: CGFloat(-latitude), y: CGFloat(-longitude), z: 0, duration: 1.0))
        
        globeNode.rotation = SCNVector4(1, 0, 0, -latitude)
        globeNode.rotation = SCNVector4(0, 1, 0, -longitude)
        
        // Clear the selected country to avoid duplicate actions
        DispatchQueue.main.async {
            selectedCountry = nil
        }
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    class Coordinator {
        var globeNode: SCNNode?
        var sceneView: SCNView?
    }
}
