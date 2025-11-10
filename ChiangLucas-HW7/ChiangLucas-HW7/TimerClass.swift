//
//  TimerClass.swift
//  ChiangLucas-HW7
//
//  Created by Lucas Chiang on 11/3/25.
//

// Project: ChiangLucas-HW7
// EID: lmc4866
// Course: CS329E

class Timer {

    var event:String
    var location:String
    var timeRemaining:Int

    init(eve:String, loc:String, time:Int) {
        event = eve
        location = loc
        timeRemaining = time
    }

}
