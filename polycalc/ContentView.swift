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
                    title: Text("New health of defender:  \(calculate()[0])"),
                    message: Text("New health of attacker: \(calculate()[1])")
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

func calculate() -> [String] {
    let attackerAttack = 2.0
    let attackerHealth = 15.0
    let attackerMaxHealth = 15.0
    
    let defenderDefence = 1.0
    let defenderHealth = 10.0
    let defenderMaxHealth = 10.0
    
    let defenceBonus = 1.0
    
    let attackForce = attackForce(power:attackerAttack,health:attackerHealth,maxHealth:attackerMaxHealth)
    let defenceForce = defenseForce(power:defenderDefence,health:defenderHealth,maxHealth:defenderMaxHealth,defenseBonus:defenceBonus)
    
    let totalDamage = attackForce + defenceForce
    
    let attackResult = attackResult(attackForce: attackForce, totalDamage: totalDamage, power: attackerAttack)
    //theres something wrong with my new health of attacker thats making the attacker lose more health than expected
    let defendResult = defendResult(defenceForce: defenceForce, totalDamage: totalDamage, power: defenderDefence)
    //let blah = defendResult(defenceForce: defenseForce(power:3,health:15,maxHealth:15, defenseBonus: 1), totalDamage: totalDamage(attack: 3, defence: 3), power: 3)
    
    
    return [String(defenderHealth - attackResult),String(attackerHealth-defendResult)]
}

//func calculateDefenderRemainingHealth() -> String {
//    let attackerPower = 3.0
//    let defenderPower = 1.0
//    let defenderHealth = 10.0
//    let defenderMaxHealth = 10.0
//    let defenceBonus = 1.0
//    //let defenderPower = 3.0
//    let defenceForce = defenseForce(power:defenderPower,health:defenderHealth,maxHealth:defenderMaxHealth,defenseBonus:defenceBonus)
//    let totalDamage = totalDamage(attack: attackerPower, defence: defenderPower)
//    let blah = defendResult(defenceForce: defenceForce, totalDamage: totalDamage, power: attackerPower)
//    //let blah = defendResult(defenceForce: defenseForce(power:3,health:15,maxHealth:15, defenseBonus: 1), totalDamage: totalDamage(attack: 3, defence: 3), power: 3)
//    return String(Int((defenderHealth - blah).rounded()))
//}

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
    return ((attackForce / totalDamage) * power * 4.5).rounded()
}

//may need to round
func defendResult (defenceForce: Double, totalDamage: Double, power: Double) -> Double {
    return ((defenceForce / totalDamage) * power * 4.5).rounded()
}

/* attackForce = attacker.attack * (attacker.health / attacker.maxHealth)
defenseForce = defender.defense * (defender.health / defender.maxHealth) * defenseBonus
totalDamage = attackForce + defenseForce
attackResult = round((attackForce / totalDamage) * attacker.attack * 4.5)
defenseResult = round((defenseForce / totalDamage) * defender.defense * 4.5)"
*/
