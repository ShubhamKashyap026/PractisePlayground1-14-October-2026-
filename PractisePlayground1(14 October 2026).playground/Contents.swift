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

// Access Control
struct BankWindow {
//    private var funds: Int = 0
    private(set) var funds: Int = 0
    
    mutating func depoist(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}


var account = BankWindow()
account.depoist(amount: 1000)

let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

//account.funds -= 5000 // private prohibit the changes of value //
//print(account.funds) // You cannot even read it when private is labelled


// private - Dont let anything outside the struct use this (both read and write not possible outside the struct)
// fileprivate - Dont let anything outside the file (.swift file) use this (both read and write not possible outside the struct)
// public - Anyone Anywhere can use this from any file or any data struct // Usally used for creating global constant like colors or error messages
// private(set) - Any one can read it and not write it



print(account.funds)


//Open access and public access enable entities to be used within any source file from their defining module, and also in a source file from another module that imports the defining module. You typically use open or public access when specifying the public interface to a framework. The difference between open and public access is described below.
//
//Package access enables entities to be used within any source files from their defining package but not in any source file outside of that package. You typically use package access within an app or framework that’s structured into multiple modules.
//
//Internal access enables entities to be used within any source file from their defining module, but not in any source file outside of that module. You typically use internal access when defining an app’s or a framework’s internal structure.
//
//File-private access restricts the use of an entity to its own defining source file. Use file-private access to hide the implementation details of a specific piece of functionality when those details are used within an entire file.
//
//Private access restricts the use of an entity to the enclosing declaration, and to extensions of that declaration that are in the same file. Use private access to hide the implementation details of a specific piece of functionality when those details are used only within a single declaration.





// More Examples of Access Control


struct FacebookUser {
    private var privatePosts: [String] = []
    public var publicPosts: [String] = []
}

let facebookUser = FacebookUser()





struct SpecialOrder {
    private var id: Int
    init(id: Int) {
        self.id = id
    }
}

let specialOrder = SpecialOrder(id: 1)





struct CoolPerson {
    private var socialSecurityNumber: String
    init(ssn: String) {
        socialSecurityNumber = ssn
    }
}
let sarah = CoolPerson(ssn: "555-55-5555")





struct Contributor {
    private var name = "Anonymous"
}

let paul = Contributor()






struct SecretAgent {
    private var actualName: String
    public var codeName: String
    init(name: String, codeName: String) {
        self.actualName = name
        self.codeName = codeName
    }
}

let bond = SecretAgent(name: "James Bond", codeName: "042")






struct Doctor {
    var name: String
    var location: String
    private var currentPatient = "No one" // Whenever you declare any private inside your struct, you have to create custom initialiser
    
    init(name: String, location: String, currentPatient: String) {
        self.name = name
        self.location = location
        self.currentPatient = currentPatient
    }
}
let drJones = Doctor(name: "Esther Jones", location: "Bristol", currentPatient: "Jerry")






struct Office {
    private var passCode: String
    var address: String
    var employees: [String]
    init(address: String, employees: [String]) {
        self.address = address
        self.employees = employees
        self.passCode = "SEKRIT"
    }
}
let monmouthStreet = Office(address: "30 Monmouth St", employees: ["Paul Hudson"])




struct School {
    var staffNames: [String]
    private var studentNames: [String]
    init(staff: [String]) {
        self.staffNames = staff
        self.studentNames = [String]()
    }
}
let royalHigh = School(staff: ["Mrs Hughes"])







struct Customer {
    var name: String
    private var creditCardNumber: Int
    init(name: String, creditCard: Int) {
        self.name = name
        self.creditCardNumber = creditCard
    }
}
let lottie = Customer(name: "Lottie Knights", creditCard: 1234567890)





// Static Properties and methods
// some method to struct itself // store constant data
// Struct.staticproperty

struct College {
    var age: Int
    @MainActor static var studentCount = 0
    
    @MainActor static func add(student: String) {
        print("\(student) joined the school")
        studentCount += 1
    }
}

College.add(student: "Bob Kane")
print(College.studentCount)

// Self // Belongs to struct or class or enum itself
// self // The current value of a struct
// Static properties are used to acces common data across project - like UserSettings etc

struct AppData {
    static let version = "1.5 beta 3"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.google.com"
}

print(AppData.saveFilename)


// Also used to store sample/example data for SwiftUI

struct SampleEmployee {
    let username: String
    let password: String
    
    static let example = SampleEmployee(username: "Kerry", password: "1234567890")
}

print(SampleEmployee.example.username)
print(SampleEmployee.example.password)





struct Unwrap {
    @MainActor static let appURL = "https://itunes.apple.com/app/id1440611372"
}



//static var entropy = Int.random(in: 1...1000)
//
//static func getEntropy() -> Int {
//    entropy += 1
//    return entropy
//}



// More Examples of Static Properties
struct Amplifier {
    static let maximumVolume = 11
    var currentVolume: Int
}




@MainActor
struct NewsStory {
    static var breakingNewsCount = 0
    static var regularNewsCount = 0
    var headline: String
    
    init(headline: String, isBreaking: Bool) {
        self.headline = headline
        if isBreaking {
            NewsStory.breakingNewsCount += 1
        } else {
            NewsStory.regularNewsCount += 1
        }
    }
}





@MainActor
struct NewCat {
    static var allCats = [NewCat]()
    init() {
        NewCat.allCats.append(self)
    }
    
    static func chorus() {
        for _ in allCats {
            print("Meow!")
        }
    }
}



@MainActor
struct Pokemon {
    static var numberCaught = 0
    var name: String
    static func catchPokemon() {
        print("Caught!")
        Pokemon.numberCaught += 1
    }
}



@MainActor
struct Raffle {
    static var ticketsUsed = 0
    var name: String
    var tickets: Int
    init(name: String, tickets: Int) {
        self.name = name
        self.tickets = tickets
        Raffle.ticketsUsed += tickets
    }
}


@MainActor
struct LegoBrick {
    static var numberMade = 0
    var shape: String
    var color: String
    init(shape: String, color: String) {
        self.shape = shape
        self.color = color
        LegoBrick.numberMade += 1
    }
}
