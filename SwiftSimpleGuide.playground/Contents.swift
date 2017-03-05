// 常量
let myConstant = 12
let explicitDouble: Double = 70

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

// 变量
var myVaribale = 2
myVaribale = 5

// 字符串拼接 \()
let apples = 3
let appleSummary = "I have \(apples) apples."

// 数组
let emptyArray = [String]()

var array = ["catfish","water", "tulips"]
array[1] = "bottle of water"
array = []

// 字典
let emptyDictionary = [String: Float]()

var occupations = [
    "Malclom": "Captain",
    "Kaylee": "Mechanic"
]
occupations["Jayne"] = "Public Relations"
occupations = [:]

// Control Flow for-in for while repeat-while
let individualScores = [75, 43, 103, 87, 12]
for score in individualScores {
    print(score)
}

// dictionary for-in
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

// while
var n = 2
while n < 100 {
    n = n * 2
}
print(n)

// repeat-while
var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)

// ..<
var totol = 0
for i in 0..<4 {
    totol += i
}
print(totol)

// switch
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

// optional
var optionalName:String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "hello, \(name)"
}

// ??
let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"

// Function and Closures
func greet1(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)"
}
greet1(person: "Bob", day: "Tuesday")

func greet2(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)"
}
greet2("John", on: "Tuesday")

func greet3(_ person: String, on day: String) -> (dec: String, num: Int) {
    return ("Hello \(person), today is \(day)", 2)
}
let result = greet3("John", on: "Tuesday")
print(result.dec)
print(result.1)

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(numbers: 42, 597, 12)

// Protocols
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

// extension
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)


// nil
/*
 Swift’s nil is not the same as nil in Objective-C. In Objective-C, nil is a pointer to a nonexistent object. In Swift, nil is not a pointer—it is the absence of a value of a certain type. Optionals of any type can be set to nil, not just object types.
 */

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
favoriteGenres.dropFirst()
print(favoriteGenres.first ?? "")


