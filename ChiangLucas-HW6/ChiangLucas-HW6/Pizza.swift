//
//  Pizza.swift
//  ChiangLucas-HW5
//
//  Created by Lucas Chiang on 10/13/25.
//

// Project: ChiangLucas-HW6
// EID: lmc4866
// Course: CS329E

class Pizza {

    var pizzaSize:String
    var crust:String
    var cheese:String
    var meat:String
    var veggies:String
    var id: String?

    init(pizzaSize:String, crust:String, cheese:String, meat:String, veggies:String, id:String) {
        self.pizzaSize = pizzaSize
        self.crust = crust
        self.cheese = cheese
        self.meat = meat
        self.veggies = veggies
        self.id = id
    }

}
