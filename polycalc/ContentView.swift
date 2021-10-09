//
//  ContentView.swift
//  polycalc
//
//  Created by hellyeah on 10/8/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .padding([.leading, .bottom, .trailing])
                .frame(width: 100.0, height: 100.0)
                .background(Color.orange)
            Text("Polycalc!")
                .padding()
            Text("Attacker!")
            Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: Text("Unit")) {
                Text("Warrior").tag(1)
                Text("Rider").tag(2)
            }
            Text("Defender!")
            Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: Text("Unit")) {
                Text("Warrior").tag(1)
                Text("Rider").tag(2)
            }
        }
        .padding()
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
