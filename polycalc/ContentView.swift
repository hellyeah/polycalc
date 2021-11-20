//
//  ContentView.swift
//  polycalc
//
//  Created by hellyeah on 10/8/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedAttackerIndex = 0
    @State private var selectedDefenderIndex = 0
    @State private var currentAttacker:Unit = Warrior
    @State private var currentDefender:Unit = Warrior
    @State private var selectedAttackerHealth = 10.0
    @State private var selectedDefenderHealth = 10.0
    @State private var showAlert = false
    @State private var pickerID:Int = 0
    
    //**we need an array of all the units
    @State var unitsArray:Array = [Warrior, Rider, Defender, Giant]
//    @State var selectedAttacker:Unit = Warrior
//    @State var selectedDefender:Unit = Warrior

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
            Picker(selection: $selectedAttackerIndex, label: Text("Unit")) {
                ForEach (unitsArray.indices) { index in
                    Text("\(unitsArray[index].name)").tag(index)
                }
                .onChange(of: selectedAttackerIndex) { _ in
                    currentAttacker = unitsArray[selectedAttackerIndex]
                    selectedAttackerHealth = unitsArray[selectedAttackerIndex].health
                }
//                Text(selectedAttacker.name).tag(1)
//                Text(unitsArray[2].name).tag(2)
            }
            Text(String(self.unitsArray[selectedAttackerIndex].health))
                .padding(.bottom, 50.0)
            
            Text("Defender!")
            
            Picker(selection: $selectedDefenderIndex, label: Text("Unit")) {
                ForEach (unitsArray.indices) { index in
                    Text("\(unitsArray[index].name)").tag(index)
                }
                .onChange(of: selectedDefenderIndex) { _ in
                    currentDefender = unitsArray[selectedDefenderIndex]
                    selectedDefenderHealth = unitsArray[selectedDefenderIndex].health
                    print("updated defender health: \(selectedDefenderHealth)")
                    self.pickerID += 1
                }
            }
            
            
            Picker(selection: $selectedDefenderHealth, label: Text("Unit")) {
                Text("\(Int(selectedDefenderHealth))").tag(1)
                ForEach (1..<Int(selectedDefenderHealth)) { index in
                    Text("\(index)").tag(index)
                }
            }
            .id(pickerID)
            Text(String(self.currentDefender.health))
                .padding(.bottom, 50.0)
//            Button(action: {
//                showAlert = true
//            }) {
//                Text("Calculate")
//            }
//            .alert(isPresented: $showAlert, content: Alert(title: "blah"))
            Button("Calculate") {
                //unitsArray[selectedAttackerIndex].health = Double(selectedAttackerHealth)
                
                currentAttacker = unitsArray[selectedAttackerIndex]
                currentAttacker.health = Double(selectedAttackerHealth)
                print(currentAttacker)
                
//                unitsArray[selectedDefenderIndex].health = Double(selectedDefenderHealth)
                
                currentDefender = unitsArray[selectedDefenderIndex]
                currentDefender.health = Double(selectedDefenderHealth)
                print(currentDefender)
                
                showAlert = true
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("New health of defender:  \(calculate(attacker:currentAttacker, defender:currentDefender)[0])"),
                    message: Text("New health of attacker: \(calculate(attacker:currentAttacker, defender:currentDefender)[1])")
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

//struct Unit {
//    let name: String
//    //let img: Image
//    //attributes
//    let attack: Double
//    let defense: Double
//    let maxHealth: Double
//    //let movement: Double
//    //make the above attributes and this a primary
//    var health: Double
//    //var terrain: String (plains, field, forest, mountain)
//    //var civ: Struct (nationality, tech)
//}

func calculate(attacker: Unit, defender: Unit) -> [String] {
//    let warrior = Unit(name: "Warrior", attack: 2.0, defense: 2.0, maxHealth: 10.0, health: 10.0)
//    let rider = Unit(name: "Rider", attack: 2.0, defense: 1.0, maxHealth: 10.0, health: 10.0)
    
//    let attacker = attacker
//    let defender = defender
    
//    let attackerAttack = 2.0
//    let attackerHealth = 15.0
//    let attackerMaxHealth = 15.0
//
//    let defenderDefence = 1.0
//    let defenderHealth = 10.0
//    let defenderMaxHealth = 10.0
    
    let defenceBonus = 1.0
    //**need to figure out how to set this
    print("attacker \(attacker)")
    print("defender \(defender)")
    let attackForce = attackForce(power:attacker.attack,health:attacker.health,maxHealth:attacker.maxHealth)
    let defenceForce = defenseForce(power:defender.defense,health:defender.health,maxHealth:defender.maxHealth,defenseBonus:defenceBonus)
    print(defenceForce)
    let totalDamage = attackForce + defenceForce
    
    let attackResult = attackResult(attackForce: attackForce, totalDamage: totalDamage, power: attacker.attack)
    //theres something wrong with my new health of attacker thats making the attacker lose more health than expected
    let defendResult = defendResult(defenceForce: defenceForce, totalDamage: totalDamage, power: defender.defense)
    //let blah = defendResult(defenceForce: defenseForce(power:3,health:15,maxHealth:15, defenseBonus: 1), totalDamage: totalDamage(attack: 3, defence: 3), power: 3)
    
    print(String(defender.health))
    print("blahblah")
    
    if(defender.health-defendResult >= 0) {
        return [String(attacker.health - attackResult),String(defender.health-defendResult)]
    } else {
        print("defender killed")
        return [String(attacker.health),String(defender.health-defendResult)]
    }

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
