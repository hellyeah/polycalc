//
//  ContentView.swift
//  polycalc
//
//  Created by hellyeah on 10/8/21.
//

import SwiftUI

struct ContentView: View {
    @State var attackerHealth:Int = 10
    @State var defenderHealth:Int = 10
    @State private var showAlert = false
    
    
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .frame(width: 100.0, height: 100.0)
                .padding([.leading, .bottom, .top, .trailing])
                .background(Color.orange)
            Text("Polycalc!")
                .padding(.bottom, 25.0)
            Text("Attacker!")
            Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: Text("Unit")) {
                Text("Warrior").tag(1)
                Text("Rider").tag(2)
            }
            Text(String(self.attackerHealth))
                .padding(.bottom, 50.0)
            Text("Defender!")
            Picker(selection: .constant(1), label: Text("Unit")) {
                Text("Warrior").tag(1)
                Text("Rider").tag(2)
            }
            Text(String(self.attackerHealth))
                .padding(.bottom, 50.0)
//            Button(action: {
//                showAlert = true
//            }) {
//                Text("Calculate")
//            }
//            .alert(isPresented: $showAlert, content: Alert(title: "blah"))
            Button("Calculate") {
                showAlert = true
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text(calculateWarriorWarrior()),
                    message: Text(calculateWarriorWarriorTwo())
                )
            }
        }
        .padding()
    
    }
}


//var body: some View {
//    Button("Tap to show alert") {
//        showAlert = true
//    }
//    .alert(isPresented: $showAlert) {
//        Alert(
//            title: Text("Current Location Not Available"),
//            message: Text("Your current location can’t be " +
//                            "determined at this time.")
//        )
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func calculateWarriorWarrior() -> String {
    let blah = attackResult(attackForce: attackForce(power:2,health:10,maxHealth:10), totalDamage: totalDamage(attack: 2, defence: 2), power: 2)
    return String(blah)
}

func calculateWarriorWarriorTwo() -> String {
    let blah = defendResult(defenceForce: attackForce(power:2,health:10,maxHealth:10), totalDamage: totalDamage(attack: 2, defence: 2), power: 2)
    return String(blah)
}

func attackForce (power: Double, health: Double, maxHealth: Double) -> Double {
    return power * (health / maxHealth)
}

func defenseForce (power: Double, health: Double, maxHealth: Double, defenseBonus: Double) -> Double {
    return power * (health / maxHealth) * defenseBonus
}

func totalDamage (attack: Double, defence: Double) -> Double {
    return attack + defence
}

//may need to round
func attackResult (attackForce: Double, totalDamage: Double, power: Double) -> Double {
    return (attackForce / totalDamage) * power * 4.5
}

//may need to round
func defendResult (defenceForce: Double, totalDamage: Double, power: Double) -> Double {
    return (defenceForce / totalDamage) * power * 4.5
}

/* attackForce = attacker.attack * (attacker.health / attacker.maxHealth)
defenseForce = defender.defense * (defender.health / defender.maxHealth) * defenseBonus
totalDamage = attackForce + defenseForce
attackResult = round((attackForce / totalDamage) * attacker.attack * 4.5)
defenseResult = round((defenseForce / totalDamage) * defender.defense * 4.5)"
*/
