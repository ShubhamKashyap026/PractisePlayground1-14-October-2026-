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
    let name: String // called Properties
    var vacationRemaining: Int = 14 // Can be given default value // called Properties
    
    mutating func takeVacation(days: Int) { // Allows modification of variables inside a structure // called Methods
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I am going on vacation")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops not enough days remaining")
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 10) // let archer not possible // cannot call muatating function on a constant // This is called instance made using intialiser // Syntatic Sugar
archer.takeVacation(days: 5) // cannot call muatating function on a constant
print(archer.vacationRemaining)

let a = 1
let b = 2.0
let c = Double(a) + b
print(c)

let kane = Employee(name: "Lana Kane")
let poovey = Employee(name: "Pam Poovey", vacationRemaining: 35)


// a tuple is effectively just a struct without a name, like an anonymous struct
let user: (name: String, age: Int, city: String)

struct User {
    let name: String
    let age: Int
    let city: String
}

user = (name: "John", age: 25, city: "Elm Street")

// Tuples have a problem: while they are great for one-off use, particularly when you want to return several pieces of data from a single function, they can be annoying to use again and again


// Methods belong to a type, such as structs, enums, and classes, whereas functions do not
// Variadic Parameters
func shoutNames(names: String...) { // ... Allows infinite number of parameters // gives an array output
    print(names)
}

shoutNames(names: "Jerry", "John", "Missy")



// Other Examples of Structures
struct Order {
    var customerID: Int
    var itemID: Int
}

let order = Order(customerID: 143, itemID: 556)






struct ChessPiece {
    var name: String
    var value: Int
}






struct NewUser {
    var name = "Anonymous"
    var age: Int
}

let twostraws = NewUser(name: "Paul", age: 38)




struct Phone {
    var manufacturer: String
    var screenSize: Double
}





struct WeatherForecast {
    var dayNumber: Int
    var temperature: Int
}

let monday = WeatherForecast(dayNumber: 1, temperature: 25)



struct Book {
    var title: String
    var author = "Unknown"
    var pageCount = 0
}



struct Player {
    var name: String
    var position: String
}


let harry = Player(name: "Harry Kane", position: "Forward")


// Examples of Mututating Functions

struct Diary {
    var entries: String
    mutating func add(entry: String) {
        entries += "\(entry)"
    }
}



struct Surgeon {
    var operationsPerformed = 0
    mutating func operate(on patient: String) {
        print("Nurse, hand me the scalpel!")
        operationsPerformed += 1
    }
}




struct Stapler {
    var stapleCount: Int
    
    
    mutating func staple() {
        if stapleCount > 0 {
            stapleCount -= 1
            print("It's stapled!")
        } else {
            print("Please refill me.")
        }
    }
}




struct Tree {
    var height: Int
    mutating func grow() {
        height *= 2
    }
}





struct NewBook {
    var totalPages: Int
    var pagesLeftToRead = 0
    mutating func read(pages: Int) {
        if pages < pagesLeftToRead {
            pagesLeftToRead -= pages
        } else {
            pagesLeftToRead = 0
            print("I'm done!")
        }
    }
}





struct BankAccount {
    var balance: Int
    mutating func donateToCharity(amount: Int) {
        balance -= amount
    }
}





struct Bicycle {
    var currentGear: Int
    mutating func changeGear(to newGear: Int) {
        currentGear = newGear
        print("I'm now in gear \(currentGear).")
    }
}


// Computed Property

struct someEmployee {
    let name: String // This is stored property
    var vacationAllocated: Int = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int { // This is an example of computed property // This is get only property // only has getter // READ ONLY
        
        // By default computed property only have a getter but if you decided to declare a set manually then you have to define get also
        get {
            let output = vacationAllocated - vacationTaken
            return output
        }
        
        set {
            print(newValue)
            vacationAllocated = vacationTaken + newValue
            // newValue is value we are setting the property to
        }
    }
}

var someArcher = someEmployee(name: "Sterling Archer", vacationAllocated: 30)
//someArcher.vacationRemaining -= 5
//print(someArcher.vacationRemaining)
//someArcher.vacationRemaining -= 3
//print(someArcher.vacationRemaining)

print(someArcher.vacationRemaining)

someArcher.vacationTaken += 4
someArcher.vacationRemaining = 5 // Now i can write to the property
print(someArcher.vacationAllocated) // Reading the property



// stored properties, where a value is stashed away in some memory to be used later

// computed properties, where a value is recomputed every time it’s called. Behind the scenes, a computed property is effectively just a function call that happens to belong to your struct


// Lazy properties help mitigate the performance issues of rarely read stored properties, and property observers mitigate the dependency problems of stored properties
// Lazy properties must always be declared as variables (var)

// A lazy property is calculated exactly once. The first time you access it, it does the work, stores (caches) the result in memory, and returns that exact same stored value for every future request
                                                                                                                                                                                
// A computed property is calculated every single time you access it. It never stores a value in memory; it simply runs the code block and returns a fresh result every time it is called.




// More Examples of computed properties

struct Code {
    var language: String
    var containsErrors = false
    var report: String {
        if containsErrors {
            return "This \(language) code has bugs!"
        } else {
            return "This looks good to me."
        }
    }
}



struct City {
    var population: Int
    var description: String {
        if population < 100_000 {
            return "This is a small city."
        } else if population < 1_000_000 {
            return "This is a medium-sized city."
        } else {
            return "This is a large city."
        }
    }
}

let tokyo = City(population: 12_000_000)



struct Candle {
    var burnLength: Int
    var alreadyBurned = 0
    
    var burnRemaining: Int {
        return burnLength - alreadyBurned
    }
}




struct Wine {
    var age: Int
    var isVintage: Bool
    var price: Int {
        if isVintage {
            return age + 20
        } else {
            return age + 5
        }
    }
}
let malbec = Wine(age: 2, isVintage: true)
print(malbec.price)




struct Medicine {
    var amount: Int
    var frequency: Int
    
    var dosage: String {
        return "Take \(amount) pills \(frequency) times a day."
    }
}





struct Dog {
    var breed: String
    var cuteness: Int
    var rating: String {
        if cuteness < 3 {
            return ("That's a cute dog!")
        } else if cuteness < 7 {
            return ("That's a really cute dog!")
        } else {
            return ("That a super cute dog!")
        }
    }
}
let luna = Dog(breed: "Samoyed", cuteness: 11)
print(luna.rating)






struct Sunglasses {
    var protectionLevel: Int
    var visionTest: String {
        if protectionLevel < 3 {
            return "These aren't very dark"
        } else if protectionLevel < 6 {
            return "These are just right"
        } else if protectionLevel < 10 {
            return "Who turned the lights out?"
        } else {
            return "Are you Blind!"
        }
    }
}




struct Swordfighter {
    var name: String
    var introduction: String {
        return "Hello, my name is \(name)."
    }
}
let inigo = Swordfighter(name: "Inigo Montoya")





struct Race {
    var distance: Int
    var runners = 0
    var description: String {
        return "This is a \(distance)km race with \(runners) runners."
    }
}
let londonMarathon = Race(distance: 42, runners: 40_000)



struct Keyboard {
    var isMechanical = false
    var noiseLevel: Int {
        if isMechanical {
            return 11
        } else {
            return 3
        }
    }
}

let majestouch = Keyboard(isMechanical: true)
print(majestouch.noiseLevel)




struct Investor {
    var age: Int
    var investmentPlan: String {
        if age < 30 {
            return "Shares"
        } else if age < 60 {
            return "Equities"
        } else {
            return "Bonds"
        }
    }
}


let investor = Investor(age: 38)
print(investor.investmentPlan)




struct Toy {
    var color: String
    var isForGirls: Bool {
        if color == "Pink" {
            return true
        } else {
            return true
        }
    }
}



// Property Observer // Run when value of computed changes // didSet // willSet


//struct Game {
//    private var _score: Int = 0
//
//    var score: Int {
//        get {
//            return _score
//        }
//        set {
//            _score = newValue
//            print("Score changed to \(_score)")
//        }
//    }
//}

struct Game {
    var score: Int = 0 {
        didSet { // Called just after the value is set or changes // provides oldValue
//            print("Old Value is \(oldValue)") // Value just before the set or changed value
            print("Score is now \(score)")
        }
    }
}


var game = Game()
game.score += 10
game.score -= 4
game.score += 3

struct App {
    var contacts = [String]() { // Computed just like Stored properties can have a default value
        willSet { // will be called just before setting the value // Is used to less frequently
            print("Current Value is \(contacts)")
            print("New Value is \(newValue)")
        }
        
        didSet { // will be called just after setting the value
            print("There are now is \(contacts.count) contacts")
            print("Old Value was \(oldValue)")
        }
    }
}

var app = App()
print("\n\n\n\n")
app.contacts.append("Arian")
app.contacts.append("Johnny")
app.contacts.append("Marry")


// Dont put too much work in property observers // That can cause slowdown

// Some Examples of Property Obeservers
struct NewBankAccount {
    var name: String
    var isMillionnaire = false
    
    var balance: Int {
        didSet {
            if balance > 1_000_000 {
                isMillionnaire = true
            } else {
                isMillionnaire = false
            }
        }
    }
}

let newBankAccount = NewBankAccount(name: "Monica", balance: 10_000_000)
print(newBankAccount.balance)
print(newBankAccount.isMillionnaire)





struct NeoApp {
    var name: String
    var isOnSale: Bool {
        didSet {
            if isOnSale {
                print("Go and download my app!")
            } else {
                print("Maybe download it later.")
            }
        }
    }
}



struct Child {
    var name: String
    var age: Int {
        didSet {
            print("Happy birthday, \(name)!")
        }
    }
}



struct StepCounter {
    var steps: Int {
        didSet {
            print("You've walked \(steps) steps - good job!")
        }
    }
}




struct FuzzyClock {
    var hour: Int {
        didSet {
            if hour < 12 {
                print("It's morning")
            } else if hour < 18 {
                print("It's the afternoon")
            } else {
                print("It's the evening.")
            }
        }
    }
}





struct FishTank {
    var capacity: Int
    var fishCount: Int {
        didSet {
            if fishCount > capacity {
                print("You have too many fish!")
            }
        }
    }
}




struct NewDog {
    var age: Int {
        didSet {
            let dogAge = age * 7
            print("I'm now \(dogAge) in dog years.")
        }
    }
}





struct FootballMatch {
    var homeTeamScore: Int {
        didSet {
            print("Yay - we scored!")
        }
    }
    var awayTeamScore: Int {
        didSet {
            print("Boo - they scored!")
        }
    }
}




struct BigGame {
    var score: Int {
        didSet {
            print("Your score is now \(score).")
        }
    }
}





struct House {
    var numberOfOccupants: Int {
        didSet {
            print("\(numberOfOccupants) people live here now.")
        }
    }
}





enum Student {
//    var age: Int   // Enum does not allow to have stored properties
    
    case gender, age, height
    
    var score: Int { // Enum does allow computed properties
        return 5
    }
}

let student1 = Student.gender
print(student1.score)


// Custom and Default Intialisers
struct Gambler {
    let name: String
    let number: Int
    
    // Default Memberwise Intialiser provided by swift
//    init(name: String, number: Int) { // Provided by Swift by default // Does not return anything // Only the Struct type
//        self.name = name
//        self.number = number
//    }
    
    // Custom Initialiser
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...30)
    }

}

//let gambler1 = Gambler(name: "Maya", number: 25) // Memberwise intialiser // Default provided by Swift // Must provided arguments in order

let gambler1 = Gambler(name: "Maya")
print(gambler1.number)


// Examples of Custom Initialiser

struct BigStudent {
    var name: String
    var bestFriend: String

    init(name: String, bestFriend: String) { // Easier to read
        print("Enrolling \(name) in class…")
        self.name = name
        self.bestFriend = bestFriend
    }
}


struct BigStudent2 {
    var name: String
    var bestFriend: String
    
    
    init(name studentName: String, bestFriend studentBestFriend: String) { // This is very clunky and bulky to read
        print("Enrolling \(studentName) in class…")
        name = studentName
        bestFriend = studentBestFriend
    }
}




struct Media {
    var type: String
    var users: Int
    init(type: String, users: Int) {
        self.type = type
        self.users = users
    }
}

let tv = Media(type: "Television", users: 10_000_000)




struct Experiment {
    var cost = 0
    
    init(cost: Int) {
        self.cost = cost
    }
}

let lhc = Experiment(cost: 13_250_000_000)






struct SomeWine {
    var grape: String
    var region: String
}
let someMalbec = SomeWine(grape: "Malbec", region: "Cahors")




struct Dictionary {
    var words = Set<String>()
}

let dictionary = Dictionary()





struct Sport {
    var name: String
    var isOlympicSport: Bool
}
let chessBoxing = Sport(name: "Chessboxing", isOlympicSport: false)






struct Country {
    var name: String
    var usesImperialMeasurements: Bool
    init(countryName: String) {
        name = countryName
        let imperialCountries = ["Liberia", "Myanmar", "USA"]
        if imperialCountries.contains(name) {
            usesImperialMeasurements = true
        } else {
            usesImperialMeasurements = false
        }
    }
}





struct SomeTree {
    var type: String
    var hasFruit: Bool
    
    init() {
        type = "Cherry"
        hasFruit = true
    }
}


let cherryTree = SomeTree()





struct Starship {
    var name: String
    var maxWarp: Double
    init(starshipName: String, maxWarp: Double) {
        name = starshipName
        self.maxWarp = maxWarp
    }
}

let voyager = Starship(starshipName: "Voyager", maxWarp: 5.0)





struct Message {
    var from: String
    var to: String
    var content: String
    init() {
        from = "Unknown"
        to = "Unknown"
        content = "Yo"
    }
}

let message = Message()





struct PowerTool {
    var name: String
    var cost: Int
}

let drill = PowerTool(name: "Hammer Drill", cost: 80)







struct Cabinet {
    var height: Double
    var width: Double
    var area: Double
    init (itemHeight: Double, itemWidth: Double) {
        height = itemHeight
        width = itemWidth
        area = height * width
    }
}
let drawers = Cabinet(itemHeight: 1.4, itemWidth: 1.0)





struct Conference {
    var name: String
    var location: String
    init(name: String, location: String) {
        self.name = name
        self.location = location
    }
}

let wwdc = Conference(name: "WWDC", location: "San Jose")




struct SuperHero {
    var nickname: String
    var powers: [String]
    init(nickname: String, superPowers: [String]) {
        self.nickname = nickname
        self.powers = superPowers
    }
}
let batman = SuperHero(nickname: "The Caped Crusader", superPowers: ["He's really rich"])




struct Kitchen {
    var utensils: [String]
    init(utensils: [String]) {
        self.utensils = utensils
    }
}





struct Parent {
    var numberOfKids: Int
    var tirednessPercent: Int
    init (kids: Int, tirednessPercent: Int) {
        self.numberOfKids = kids
        self.tirednessPercent = tirednessPercent
    }
}
let james = Parent(kids: 2, tirednessPercent: 10)





struct Language {
    var nameEnglish: String
    var nameLocal: String
    var speakerCount: Int
    init(english: String, local: String, speakerCount: Int) {
        self.nameEnglish = english
        self.nameLocal = local
        self.speakerCount = speakerCount
    }
}
let french = Language(english: "French", local: "français", speakerCount: 220_000_000)





struct Bus {
    var routeNumber: Int
    init(route: Int) {
        self.routeNumber = route
    }
}




struct Cat {
    var name: String
    var breed: String
    var meowVolume: Int = 1
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}
let toby = Cat(name: "Toby", breed: "Burmese")





struct Character {
    var name: String
    var actor: String
    var probablyGoingToDie: Bool
    init(name: String, actor: String) {
        self.name = name
        self.actor = actor
        if self.actor == "Sean Bean" {
            probablyGoingToDie = true
        } else {
            probablyGoingToDie = false
        }
    }
}




struct Cottage {
    var rooms: Int
    var rating = 5
    init(rooms: Int) {
        self.rooms = rooms
    }
}
let bailbrookHouse = Cottage(rooms: 4)





struct Framework {
    var name: String
    var language: String
    init(name: String, language: String) {
        self.name = name
        self.language = language
    }
}
let vapor = Framework(name: "Vapor", language: "Swift")




struct Computer {
    var cpus: Int
    var ramGB: Int
    init(cpus: Int, ram: Int) {
        self.cpus = cpus
        self.ramGB = ram
    }
}




struct District {
    var number: Int
    var supervisor: String
    init(number: Int, supervisor: String) {
        self.number = number
        self.supervisor = supervisor
    }
}
let district = District(number: 9, supervisor: "Unknown")




// Static properties and Access control
