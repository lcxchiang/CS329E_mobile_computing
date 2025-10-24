// Project: ChiangLucas-HW1
// EID: lmc4866
// Course: CS329E

// Item Classes

class Weapon {

    let weaponType:String
    var damage:Int

    init (weaponType:String = "none") {

        self.weaponType = weaponType

        if (self.weaponType == "dagger") {
            damage = 4
        }

        else if (self.weaponType == "axe") {
            damage = 6
        }

        else if (self.weaponType == "staff") {
            damage = 6
        }

        else if (self.weaponType == "sword") {
            damage = 10
        }

        else {
            damage = 1
        }

    }

}

class Armor {

    let armorType:String
    var armorClass:Int

    init (armorType:String = "none") {

        self.armorType = armorType

        if (self.armorType == "plate") {
            armorClass = 2
        }

        else if (self.armorType == "chain") {
            armorClass = 5
        }

        else if (self.armorType == "leather") {
            armorClass = 8
        }

        else {
            armorClass = 10
        }

    }

}

// Character Class

class RPGCharacter {

    var characterName:String
    var health:Int
    var spellPoints:Int
    var wearing:Armor
    var wielding:Weapon
    var invalidWeapons:[String]

    init (characterName:String = "") {
        self.characterName = characterName
        self.health = 0
        self.spellPoints = 0
        self.wearing = Armor(armorType: "none")
        self.wielding = Weapon(weaponType: "none")
        self.invalidWeapons = []
    }

    func wield (weaponObject:Weapon) {
        if invalidWeapons.contains(weaponObject.weaponType) {
            print("Weapon not allowed for this character class")
        }
        else {
            self.wielding = weaponObject
            print("\(characterName) is now wielding a(n) \(wielding.weaponType)")
        }
    }

    func unwield () {
        self.wielding = Weapon(weaponType:"none")
        print("\(characterName) is no longer wielding anything")
    }

    func putOnArmor(armorObject:Armor) {
        self.wearing = armorObject
        print("\(characterName) is now wearing \(armorObject.armorType)")
    }

    func takeOffArmor() {
        self.wearing = Armor(armorType: "none")
        print("\(self.characterName) is no longer wearing any armor")
    }

    func fight(opponent:RPGCharacter) {
        print("\(self.characterName) attacks \(opponent.characterName) with a(n) \(self.wielding.weaponType)")
        opponent.health = opponent.health - self.wielding.damage
        print("\(self.characterName) does \(self.wielding.damage) damage to \(opponent.characterName)")
        print("\(opponent.characterName) is now down to \(opponent.health) health")
        checkForDefeat(opponent: opponent)
    }

    func checkForDefeat(opponent:RPGCharacter) {
        if (opponent.health <= 0 ) {
            print("\(opponent.characterName) has been defeated!")
        }
    }

    func show() {
        print("\(self.characterName)")
        print("   Current Health:  \(self.health)")
        print("   Current Spell Points:  \(self.spellPoints)")
        print("   Wielding:  \(self.wielding.weaponType)")
        print("   Wearing:  \(self.wearing.armorType)")
        print("   Armor Class:  \(self.wearing.armorClass)")
    }

}

// Character Subclasses

class Fighter:RPGCharacter {

    init (name:String) {
        super.init(characterName:name)
        health = 40
        spellPoints = 0
    }

}

class Wizard:RPGCharacter {

    init (name:String) {
        super.init(characterName:name)
        health = 16
        spellPoints = 20
        invalidWeapons = ["axe", "sword"]
    }

    override func putOnArmor(armorObject:Armor) {
        print("Armor not allowed for this character class")
    }

    func castSpell (spellName:String, target:RPGCharacter) {
        if (spellName == "Fireball") {

            let cost = 3
            let effect = 5 // -5 to health (causing 5 dmg)

            if (self.spellPoints < cost) { // Check if there are enough spell points
                print("Insufficient spell points")
                return
            }

            print("\(self.characterName) casts \(spellName) at \(target.characterName)")

            target.health -= effect
            self.spellPoints -= cost

            print("\(self.characterName) does \(effect) damage to \(target.characterName)")
            print("\(target.characterName) is now down to \(target.health) health")

            checkForDefeat(opponent:target)
        }

        else if (spellName == "Lightning Bolt") {

            let cost = 10
            let effect = 10 // -10 to health (causing 5 dmg)

            if (self.spellPoints < cost) { // Check if there are enough spell points
                print("Insufficient spell points")
                return
            }

            print("\(self.characterName) casts \(spellName) at \(target.characterName)")

            target.health -= effect
            self.spellPoints -= cost

            print("\(self.characterName) does \(effect) damage to \(target.characterName)")
            print("\(target.characterName) is now down to \(target.health) health")

            checkForDefeat(opponent:target)
        }

        else if (spellName == "Heal") {

            let cost = 6
            let effect = -6 // +6 to health, healing the target

            if (self.spellPoints < cost) {  // Check if there are enough spell points
                print("Insufficient spell points")
                return
            }

            print("\(self.characterName) casts \(spellName) at \(target.characterName)")

            if (target is Fighter && target.health - effect >= 40) { // Fighter cannot have more than 40 health pts
                print("\(self.characterName) heals \(target.characterName) for \(40 - target.health) health points")
                target.health = 40
            }

            else if (target is Wizard && target.health - effect >= 16) { // Wizard cannot have more than 16 health pts
                print("\(self.characterName) heals \(target.characterName) for \(16 - target.health) health points")
                target.health = 16
            }

            else {
                print("\(self.characterName) heals \(target.characterName) for \(abs(effect)) health points")
                target.health -= effect
            }

            self.spellPoints -= cost

            print("\(target.characterName) is now at \(target.health) health")
        }

        else {
            print("Unknown spell name. Spell failed.")
            return
        }

    }

}

// top level code

let plateMail = Armor(armorType: "plate")
let chainMail = Armor(armorType: "chain")
let sword = Weapon(weaponType: "sword")
let staff = Weapon(weaponType: "staff")
let axe = Weapon(weaponType: "axe")

let gandalf = Wizard(name: "Gandalf the Grey")
gandalf.wield(weaponObject: staff)

let aragorn = Fighter(name: "Aragorn")
aragorn.putOnArmor(armorObject: plateMail)
aragorn.wield(weaponObject: axe)

gandalf.show()
aragorn.show()

gandalf.castSpell(spellName: "Fireball", target: aragorn)
aragorn.fight(opponent: gandalf)

gandalf.show()
aragorn.show()

gandalf.castSpell(spellName: "Lightning Bolt", target: aragorn)
aragorn.wield(weaponObject: sword)

gandalf.show()
aragorn.show()

gandalf.castSpell(spellName: "Heal", target: gandalf)
aragorn.fight(opponent: gandalf)

gandalf.fight(opponent: aragorn)
aragorn.fight(opponent: gandalf)

gandalf.show()
aragorn.show()
