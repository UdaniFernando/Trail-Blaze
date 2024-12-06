//
//  HomeView.swift
//  Trail Blaze
//
//  Created by Udani Fernando on 03/12/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selectedIndex: Int =  0
    @GestureState private var dragOffset: CGFloat = 0
    
    @State private var navigateToDetail: Bool = false
    
    @State var isFirstAppearance : Bool = true
    
    let cards: [Card] = [
        Card(title: "Card 1", description: "Description for card 1", imageName: "thailand"),
        Card(title: "Card 2", description: "Description for card 2", imageName: "northpole"),
        Card(title: "Card 3", description: "Description for card 3", imageName: "norway"),
        Card(title: "Card 4", description: "Description for card 3", imageName: "australia"),
        Card(title: "Card 5", description: "Description for card 3", imageName: "dubai"),
        Card(title: "Card 6", description: "Description for card 3", imageName: "singapore"),
        Card(title: "Card 7", description: "Description for card 3", imageName: "japan"),
        Card(title: "Card 1", description: "Description for card 1", imageName: "thailand"),
        Card(title: "Card 2", description: "Description for card 2", imageName: "northpole"),
        Card(title: "Card 3", description: "Description for card 3", imageName: "norway"),
        Card(title: "Card 4", description: "Description for card 3", imageName: "australia"),
        Card(title: "Card 5", description: "Description for card 3", imageName: "dubai"),
        Card(title: "Card 6", description: "Description for card 3", imageName: "singapore"),
        Card(title: "Card 7", description: "Description for card 3", imageName: "japan")
    ]
    
    @Namespace private var animationNamespace
    
    var body: some View {
        ZStack {
            if !navigateToDetail {
                // Home View
                ZStack {
                    ForEach(cards.indices, id: \.self) { index in
                        CardView(card: cards[index])
                            .frame(width: 200, height: 300)
                            .scaleEffect(index == selectedIndex ? 1.0 : 0.9)
                            .offset(
                                x: CGFloat(index - selectedIndex) * 40,
                                y: CGFloat(abs(index - selectedIndex)) * 20
                            )
                            .zIndex(index == selectedIndex ? 1 : 0)
                            .animation(.spring(), value: selectedIndex)
                            .matchedGeometryEffect(id: cards[index].imageName.hashValue, in: animationNamespace)
                            .gesture(
                                DragGesture()
                                    .onEnded { value in
                                        let threshold: CGFloat = 100
                                        if value.translation.width < -threshold, selectedIndex < cards.count - 1 {
                                            selectedIndex += 1
                                        } else if value.translation.width > threshold, selectedIndex > 0 {
                                            selectedIndex -= 1
                                        } else if value.translation.height < -threshold, index == selectedIndex {
                                            withAnimation(.easeInOut) {
                                                navigateToDetail = true
                                            }
                                        }
                                    }
                            )
                    }
                }
                .onAppear {
                    if isFirstAppearance {
                        selectedIndex = Int(cards.count / 2)
                        isFirstAppearance = false
                    }
                }
            } else {
                // Detail View
                DestinationView(card: cards[selectedIndex],
                                animationNamespace: animationNamespace,
                                onSwipeDown: {
                    withAnimation(.easeInOut) {
                        navigateToDetail = false
                    }
                })
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1).ignoresSafeArea())
    }
    
}


struct CardView: View {
    let card: Card
    var isOnStack : Bool = true

    var body: some View {
        ZStack {
            Image(card.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: isOnStack ? 200 : nil) 
                .frame(maxWidth: isOnStack ? nil : .infinity)
            Color.black.opacity(0.4)
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: .black, radius: 10)
        .padding(.vertical, 10)
    }
}


#Preview {
    HomeView()
}
