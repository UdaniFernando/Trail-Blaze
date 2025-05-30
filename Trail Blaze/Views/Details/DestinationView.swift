//
//  DestinationView.swift
//  Trail Blaze
//
//  Created by Udani Fernando on 06/12/2024.
//

import SwiftUI

struct DestinationView: View {
    let card: Card
    let animationNamespace: Namespace.ID
    let onSwipeDown: () -> Void
    
    @State private var showDetailContent = false
    @GestureState private var dragOffset: CGFloat = 0
    
    @StateObject var weatherVM : WeatherViewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            // Card at the top
            CardView(card: card, isOnStack: false)
                .frame(width: getScreenWidth() ,height: 300)
                .matchedGeometryEffect(id: card.imageName.hashValue, in: animationNamespace)
                .offset(y: dragOffset)
                .gesture(
                    DragGesture()
                        .updating($dragOffset) { value, state, _ in
                            if value.translation.height > 0 {
                                state = value.translation.height
                            }
                        }
                        .onEnded { value in
                            if value.translation.height > 150 {
                                // Trigger the backward animation
                                onSwipeDown()
                            }
                        }
                )
                .onAppear {
                    withAnimation(.easeInOut.delay(0.2)) {
                        showDetailContent = true
                    }
                }
            
            if showDetailContent {
                // Additional content
                Text(card.description)
                    .font(.roboto(.medium, size: 14))
                    .lineSpacing(10)
                    .padding()
                    .transition(.opacity)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
        .onAppear{
            weatherVM.fetchWeather(for: card.title)
        }
    }
}

//#Preview {
//    DestinationView()
//}
