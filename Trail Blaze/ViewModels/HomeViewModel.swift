//
//  HomeViewModel.swift
//  Trail Blaze
//
//  Created by Udani Fernando on 06/12/2024.
//

import Foundation

class HomeViewModel : ObservableObject {
    let cards: [Card] = [
        Card(title: "Thailand", description: "Thailand is a Southeast Asian country. It's known for tropical beaches, opulent royal palaces, ancient ruins and ornate temples displaying figures of Buddha. In Bangkok, the capital, an ultramodern cityscape rises next to quiet canalside communities and the iconic temples of Wat Arun, Wat Pho and the Emerald Buddha Temple (Wat Phra Kaew). Nearby beach resorts include bustling Pattaya and fashionable Hua Hin", imageName: "thailand"),
        
        Card(title: "The North Pole, also known as the Geographic North Pole or Terrestrial North Pole, is the point in the Northern Hemisphere where the Earth's axis of rotation meets its surface. It is called the True North Pole to distinguish from the Magnetic North Pole", description: "Description for card 2", imageName: "northpole"),
        Card(title: "Norway", description: "Description for card 3", imageName: "norway"),
        
        Card(title: "Australia", description: "Australia, officially the Commonwealth of Australia, is a country comprising the mainland of the Australian continent, the island of Tasmania and numerous smaller islands. Australia has a total area of 7,688,287 km², making it the sixth-largest country in the world and the largest country by area in Oceania", imageName: "australia"),
        
        Card(title: "Dubai", description: "Dubai is a city and emirate in the United Arab Emirates known for luxury shopping, ultramodern architecture and a lively nightlife scene. Burj Khalifa, an 830m-tall tower, dominates the skyscraper-filled skyline. At its foot lies Dubai Fountain, with jets and lights choreographed to music. On artificial islands just offshore is Atlantis, The Palm, a resort with water and marine-animal parks", imageName: "dubai"),
        
        Card(title: "Singapore", description: "Singapore, officially the Republic of Singapore, is an island country and city-state in Southeast Asia. The country's territory comprises one main island, 63 satellite islands and islets, and one outlying islet.", imageName: "singapore"),
        
        Card(title: "Japan", description: "Japan is an island country in East Asia. Located in the Pacific Ocean off the northeast coast of the Asian mainland, it is bordered on the west by the Sea of Japan and extends from the Sea of Okhotsk in the north to the East China Sea in the south.", imageName: "japan"),
        
        Card(title: "Thailand", description: "Thailand is a Southeast Asian country. It's known for tropical beaches, opulent royal palaces, ancient ruins and ornate temples displaying figures of Buddha. In Bangkok, the capital, an ultramodern cityscape rises next to quiet canalside communities and the iconic temples of Wat Arun, Wat Pho and the Emerald Buddha Temple (Wat Phra Kaew). Nearby beach resorts include bustling Pattaya and fashionable Hua Hin", imageName: "thailand"),
        
        Card(title: "The North Pole, also known as the Geographic North Pole or Terrestrial North Pole, is the point in the Northern Hemisphere where the Earth's axis of rotation meets its surface. It is called the True North Pole to distinguish from the Magnetic North Pole", description: "Description for card 2", imageName: "northpole"),
        Card(title: "Norway", description: "Description for card 3", imageName: "norway"),
        
        Card(title: "Australia", description: "Australia, officially the Commonwealth of Australia, is a country comprising the mainland of the Australian continent, the island of Tasmania and numerous smaller islands. Australia has a total area of 7,688,287 km², making it the sixth-largest country in the world and the largest country by area in Oceania", imageName: "australia"),
        
        Card(title: "Dubai", description: "Dubai is a city and emirate in the United Arab Emirates known for luxury shopping, ultramodern architecture and a lively nightlife scene. Burj Khalifa, an 830m-tall tower, dominates the skyscraper-filled skyline. At its foot lies Dubai Fountain, with jets and lights choreographed to music. On artificial islands just offshore is Atlantis, The Palm, a resort with water and marine-animal parks", imageName: "dubai"),
        
        Card(title: "Singapore", description: "Singapore, officially the Republic of Singapore, is an island country and city-state in Southeast Asia. The country's territory comprises one main island, 63 satellite islands and islets, and one outlying islet.", imageName: "singapore"),
        
        Card(title: "Japan", description: "Japan is an island country in East Asia. Located in the Pacific Ocean off the northeast coast of the Asian mainland, it is bordered on the west by the Sea of Japan and extends from the Sea of Okhotsk in the north to the East China Sea in the south.", imageName: "japan"),
    ]
}
