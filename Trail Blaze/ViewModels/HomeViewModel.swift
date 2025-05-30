//
//  HomeViewModel.swift
//  Trail Blaze
//
//  Created by Udani Fernando on 06/12/2024.
//

import Foundation

class HomeViewModel : ObservableObject {
    
    @Published var startCreateTrail : Bool = false
    
    
    
    
    let cards: [Card] = [
        Card(title: "Thailand", description: "Thailand is a Southeast Asian country. It's known for tropical beaches, opulent royal palaces, ancient ruins and ornate temples displaying figures of Buddha. In Bangkok, the capital, an ultramodern cityscape rises next to quiet canalside communities and the iconic temples of Wat Arun, Wat Pho and the Emerald Buddha Temple (Wat Phra Kaew). Nearby beach resorts include bustling Pattaya and fashionable Hua Hin", imageName: "thailand"),
        
        Card(title: "Northpole", description: "The North Pole, also known as the Geographic North Pole or Terrestrial North Pole, is the point in the Northern Hemisphere where the Earth's axis of rotation meets its surface. It is called the True North Pole to distinguish from the Magnetic North Pole", imageName: "northpole"),
        
        Card(title: "Norway", description: "Norway is a Scandinavian country encompassing mountains, glaciers and deep coastal fjords. Oslo, the capital, is a city of green spaces and museums. Preserved 9th-century Viking ships are displayed at Oslo’s Viking Ship Museum. Bergen, with colorful wooden houses, is the starting point for cruises to the dramatic Sognefjord. Norway is also known for fishing, hiking and skiing, notably at Lillehammer’s Olympic resort. ", imageName: "norway"),
        
        Card(title: "Australia", description: "Australia, officially the Commonwealth of Australia, is a country comprising the mainland of the Australian continent, the island of Tasmania and numerous smaller islands. Australia has a total area of 7,688,287 km², making it the sixth-largest country in the world and the largest country by area in Oceania", imageName: "australia"),
        
        Card(title: "Dubai", description: "Dubai is a city and emirate in the United Arab Emirates known for luxury shopping, ultramodern architecture and a lively nightlife scene. Burj Khalifa, an 830m-tall tower, dominates the skyscraper-filled skyline. At its foot lies Dubai Fountain, with jets and lights choreographed to music. On artificial islands just offshore is Atlantis, The Palm, a resort with water and marine-animal parks", imageName: "dubai"),
        
        Card(title: "Singapore", description: "Singapore, officially the Republic of Singapore, is an island country and city-state in Southeast Asia. The country's territory comprises one main island, 63 satellite islands and islets, and one outlying islet.", imageName: "singapore"),
        
        Card(title: "Japan", description: "Japan is an island country in East Asia. Located in the Pacific Ocean off the northeast coast of the Asian mainland, it is bordered on the west by the Sea of Japan and extends from the Sea of Okhotsk in the north to the East China Sea in the south.", imageName: "japan"),
        

        Card(title: "Morocco", description: "Morocco is a North African country bordering the Atlantic Ocean and Mediterranean Sea. It’s distinguished by its Berber, Arabian and European cultural influences. Marrakesh’s medina is a maze of alleys and vibrant souks selling traditional textiles, pottery and jewelry. A symbol of the city, the Moorish minaret of 12th-century Koutoubia Mosque is visible for miles.", imageName: "morocco"),

        Card(title: "New Zealand", description: "New Zealand is an island country in the southwestern Pacific Ocean. It consists of two main landmasses—the North Island and the South Island—and over 700 smaller islands. Known for its breathtaking landscapes, Maori culture, and adventure sports, New Zealand is a favorite for travelers seeking both tranquility and adrenaline.", imageName: "newzealand"),

        Card(title: "Canada", description: "Canada is a North American country stretching from the U.S. in the south to the Arctic Circle in the north. Major cities include Toronto, Vancouver, Montreal, and Quebec City. It's known for its vast wilderness, maple syrup, multiculturalism, and polite vibes. From the Rockies to the Atlantic, it’s all postcard-worthy.", imageName: "canada"),

        Card(title: "Brazil", description: "Brazil is the largest country in South America and the fifth-largest in the world. It’s famous for its Amazon rainforest, iconic Christ the Redeemer statue, lively Carnival festival, and passionate football culture. Rio de Janeiro and São Paulo offer a mix of natural beauty and urban energy.", imageName: "brazil"),

        Card(title: "Switzerland", description: "Switzerland is a mountainous Central European country, home to numerous lakes, villages and the high peaks of the Alps. Its cities contain medieval quarters, with landmarks like capital Bern’s Zytglogge clock tower and Lucerne’s wooden chapel bridge. The country is also famous for chocolate, watches and neutrality.", imageName: "switzerland"),

        Card(title: "Greece", description: "Greece is a southeastern European country with thousands of islands throughout the Aegean and Ionian seas. It's often called the cradle of Western civilization and is known for its ancient ruins, mythology, olive oil, and whitewashed villages like those found on Santorini and Mykonos.", imageName: "greece"),

        Card(title: "Kenya", description: "Kenya is a country in East Africa with coastline on the Indian Ocean. It encompasses savannah, lake lands, the dramatic Great Rift Valley and mountain highlands. It's famed for its wildlife, from lions and elephants to rhinos, and is one of the best places in the world for safari.", imageName: "kenya"),

        Card(title: "South Korea", description: "South Korea, an East Asian nation on the southern half of the Korean Peninsula, shares one of the world’s most heavily militarized borders with North Korea. It’s equally known for its green, hilly countryside, cherry blossoms, K-pop, technology giants, and spicy, flavorful cuisine like kimchi.", imageName: "southkorea"),
    ]
}
