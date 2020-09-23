//
//  AstronautView.swift
//  Moonshot
//
//  Created by Alex Sapsford on 23/09/2020.
//  Copyright © 2020 Alex Sapsford. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missionsFlown: [String]
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack{
                    Image(self.astronaut.id)
                    .resizable()
                    .scaledToFit()
                        .frame(width: geometry.size.width)
                    Text(self.astronaut.description)
                    .padding()
                    
                    ForEach(self.missionsFlown, id: \.self ) { mission in
                        VStack{
                            Text(mission.description)
                                .font(.headline)
                        }
                    }
                    
                
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
     
    init(astronaut: Astronaut) {
        self.astronaut = astronaut
        
        var matches = [String]()
        
        for mission in missions {
            if mission.crew.contains(where: {$0.name == astronaut.id}) {
                matches.append("\(mission.displayName)")
            }
        }
        self.missionsFlown = matches
    }
    
    }


struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
