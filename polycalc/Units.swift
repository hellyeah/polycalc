//
//  Units.swift
//  polycalc
//
//  Created by hellyeah on 10/29/21.
//

import Foundation

struct Unit {
    let name: String
    //let img: Image
    //attributes
    let attack: Double
    let defense: Double
    let maxHealth: Double
    //let movement: Double
    //make the above attributes and this a primary
    var health: Double
    //var terrain: String (plains, field, forest, mountain)
    //var civ: Struct (nationality, tech)
    var defenceBonus: Double
}

let Warrior = Unit(name: "Warrior", attack: 2.0, defense: 2.0, maxHealth: 10.0, health: 10.0, defenceBonus: 1.0)
let Rider = Unit(name: "Rider", attack: 2.0, defense: 1.0, maxHealth: 10.0, health: 10.0, defenceBonus: 1.0)
let Defender = Unit(name: "Defender", attack: 1.0, defense: 3.0, maxHealth: 15.0, health: 15.0, defenceBonus: 1.0)
let Giant = Unit(name: "Giant", attack: 5.0, defense: 4.0, maxHealth: 40.0, health: 40.0, defenceBonus: 1.0)
let Giant2 = Unit(name: "Giant2", attack: 5.0, defense: 4.0, maxHealth: 40.0, health: 22.0, defenceBonus: 1.0)

