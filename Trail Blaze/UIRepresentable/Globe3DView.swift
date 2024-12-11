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

        // Create a sphere for the globe
        let globe = SCNSphere(radius: 1.0)
        if let earthTexture = UIImage(named: "earth_texture") {
            globe.firstMaterial?.diffuse.contents = earthTexture
            globe.firstMaterial?.isDoubleSided = true
        }

        // Add the globe to the scene
        let globeNode = SCNNode(geometry: globe)
        globeNode.position = SCNVector3(0, 0, 0)
        scene.rootNode.addChildNode(globeNode)

        // Add a directional light (to simulate sunlight)
        let directionalLight = SCNLight()
        directionalLight.type = .directional
        directionalLight.castsShadow = true
        let directionalLightNode = SCNNode()
        directionalLightNode.light = directionalLight
        directionalLightNode.position = SCNVector3(0, 5, 5)  // Position the light at an angle
        directionalLightNode.look(at: globeNode.position) // Direct the light towards the globe
        scene.rootNode.addChildNode(directionalLightNode)

        // Add an ambient light (to provide general light from all directions)
        let ambientLight = SCNLight()
        ambientLight.type = .ambient
        ambientLight.color = UIColor.white.withAlphaComponent(0.3) // Soft light
        let ambientLightNode = SCNNode()
        ambientLightNode.light = ambientLight
        scene.rootNode.addChildNode(ambientLightNode)

        // Add a camera
        let camera = SCNCamera()
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(0, 0, 3)
        scene.rootNode.addChildNode(cameraNode)

                
        // If user location is available, rotate globe to that location
                if let userLocation = userLocation {
                    
                    let pinNode = SCNNode(geometry: SCNSphere(radius: 0.02))
                    pinNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
                    // Convert lat/lon to radians
                    let latitude = userLocation.coordinate.latitude * .pi / 180
                    let longitude = userLocation.coordinate.longitude * .pi / 180

                    // Rotate the globe to the correct position
                    // The rotation logic here is based on the angle of the location
                    let rotationX = Float(latitude)  // Latitude influences the X rotation (pitch)
                    let rotationY = Float(longitude)  // Longitude influences the Y rotation (yaw)
                    
                    print("Latitude in radians: \(latitude), Longitude in radians: \(longitude)")

                    // Apply the rotation to the globe node
                    globeNode.rotation = SCNVector4(1, 0, 0, -rotationX) // Rotate around X-axis (latitude)
                    globeNode.rotation = SCNVector4(0, 1, 0, -rotationY) // Rotate around Y-axis (longitude)
                    
                    let x = cos(latitude) * cos(longitude)
                    let y = sin(latitude)
                    let z = cos(latitude) * sin(longitude)
                    
                    print("Pin position: x: \(x), y: \(y), z: \(z)")
                    
                    pinNode.position = SCNVector3(x: Float(x), y: Float(y), z: Float(z))
                    
//                  pinNode.rotation = globeNode.rotation
                    
                    globeNode.addChildNode(pinNode)
                    
                }

        // Set up the scene view
        sceneView.scene = scene
        sceneView.allowsCameraControl = true // Allow user interaction
        sceneView.backgroundColor = .clear
        return sceneView
    }

    func updateUIView(_ uiView: SCNView, context: Context) {}
}
