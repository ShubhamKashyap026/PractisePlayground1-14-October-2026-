import Cocoa

var greeting = "Hello, playground"

struct Album {
    let title: String
    let artist: String
    let year: String
    
    func printSummary() {
        print("\(title) \(year) \(artist)")
    }
}

let album1 = Album(title: "John Kane", artist: "Bob Marley", year: "1989")

let wings = Album(title: "Wings", artist: "BTS", year: "2016")
let red = Album(title: "Red", artist: "Taylor Swift", year: "2012")

print(red.title)
print(wings.artist)

album1.printSummary()
red.printSummary()
wings.printSummary()

struct Employee {
    let name: String
    var vacationRemaining: Int
    
    mutating func takeVacation(days: Int) { // Allows modification of variables inside a structure
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I am going on vacation")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops not enough days remaining")
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14) // let archer not possible // cannot call muatating function on a constant
archer.takeVacation(days: 5) // cannot call muatating function on a constant
print(archer.vacationRemaining)
