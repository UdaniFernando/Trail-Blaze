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
    
  
    @StateObject var homeVM : HomeViewModel = HomeViewModel()
    
    @Namespace private var animationNamespace
    
    var body: some View {
        ZStack {
            if !navigateToDetail {
                // Home View
                
                VStack{
                    homeCardView()
                    
                    Spacer()
                    
                    startATrailButtonView()
                }
               
            } else {
                // Detail View
                DestinationView(card: homeVM.cards[selectedIndex],
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
        .fullScreenCover(isPresented: $homeVM.startCreateTrail, content: {
            DestinationsSelectionView()
        })
    }
    
    
    
    
    @ViewBuilder func homeCardView() -> some View{
        ZStack {
            ForEach(homeVM.cards.indices, id: \.self) { index in
                CardView(card: homeVM.cards[index])
                    .frame(width: 200, height: 300)
                    .scaleEffect(index == selectedIndex ? 1.0 : 0.9)
                    .offset(
                        x: CGFloat(index - selectedIndex) * 40,
                        y: CGFloat(abs(index - selectedIndex)) * 20
                    )
                    .zIndex(index == selectedIndex ? 1 : 0)
                    .animation(.spring(), value: selectedIndex)
                    .matchedGeometryEffect(id: homeVM.cards[index].imageName.hashValue, in: animationNamespace)
                    .gesture(
                        DragGesture()
                            .onEnded { value in
                                let threshold: CGFloat = 100
                                if value.translation.width < -threshold, selectedIndex < homeVM.cards.count - 1 {
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
                selectedIndex = Int(homeVM.cards.count / 2)
                isFirstAppearance = false
            }
        }
    }
    
    @ViewBuilder func startATrailButtonView () -> some View {
       
            Button(action: {
                homeVM.startCreateTrail = true
            }, label: {
                HStack(alignment: .center){
                    Text("Start a Trail")
                        .font(.roboto(.medium, size: 15))
                        .foregroundStyle(.lightBlack)
                        .padding(.leading)
                    
                    Image("Path-Mint")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.trailing)
                } .frame(height: 55)
                .background {
                    Color.darkWhite
                }.clipShape(.capsule)
                   
                    .shadow(radius: 10)
                   
                
            })
        
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
                .frame(width: isOnStack ? 200 : nil, height: isOnStack ? nil : 300)
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
