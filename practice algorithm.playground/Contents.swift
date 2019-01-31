import UIKit

// lession 1: Calculator 2 number
func sum(num1: Int, num2: Int) -> Int {
    return num1 + num2
}
print(sum(num1: 10, num2: 20))

// lession 2: Given a year, return the century it is in. The first century spans from the year 1 up to and including the year 100, the second - from the year 101 up to and including the year 200, etc.

func centuryFromYear(year: Int) -> Int {
    return Int((year-1) / 100) + 1
}
print(centuryFromYear(year: 1900))




// lession 3: Given the string, check if it is a palindrome.
func isPalindrome(str: String) -> Bool {
    let reverseString = String(str.characters.reversed())
    if(str != "" && str == reverseString) {
        return true
    } else {
        return false
    }
}
print(isPalindrome(str: "aabaa"))

// lession 4: Given an array of integers, find the pair of adjacent elements that has the largest product and return that product.

func adjacentElementsProduct(inputArray: [Int]) -> Int {
    var max = inputArray[0] * inputArray[1]
    for i in 2..<inputArray.count {
        if max < inputArray[i-1] * inputArray[i] {
            max = inputArray[i-1] * inputArray[i]
        }
    }
    return max
}
print(adjacentElementsProduct(inputArray: [3, 6, -2, -5, 7, 3]))

// lession 5: Find the area of a polygon for a given n.

func shapeArea(n: Int) -> Int {
    if(n == 1) {
        var area = 1
        return area
    }
    else {
        var area = shapeArea(n: n-1) + (4 * (n-1))
        return area
    }
}
shapeArea(n: 5)

// lession 6:

func makeArrayConsecutive2(statues: [Int]) -> Int {
    let arr = statues.sorted()
    var missing = 0
    for i in 0..<arr.count - 1 {
        missing += arr[i+1] - arr[i] - 1
    }
    return missing
}

makeArrayConsecutive2(statues: [6, 2, 3, 8])

// lession 7:
func almostIncreasingSequence(sequence: [Int]) -> Bool {
    
    if sequence.count <= 1 {
        return false
    } else {
        if checkStrictlySequence(arr: sequence) == true {
            return true
        }
    }
    var arr = sequence
    var index: [Int] = []
    for i in 0..<arr.count - 1 {
        
        if arr[i+1] <= arr[i] {
            index += [i, i+1]
        }
    }
    for i in 0..<index.count {
        var arr = sequence
        arr.remove(at: index[i])
        if checkStrictlySequence(arr: arr) == true {
            return true
        }
    }
    
    return false
}

func checkStrictlySequence(arr: [Int]) -> Bool {
    for i in 0..<(arr.count-1) {
        if arr[i] >= arr[i+1] {
            return false
        }
    }
    return true
}

almostIncreasingSequence(sequence: [3, 5, 67, 98, 3])

// lession 8:
func matrixElementsSum(matrix: [[Int]]) -> Int {
    var a = matrix
    
    for i in 0..<a.count - 1 {
        for j in 0..<a[i].count {
            if a[i][j] < 1 {
                for k in (i+1)..<a.count {
                    a[k][j] = 0
                }
            }
        }
    }
    
    var sumMaxRoomCanStay = 0
    for i in 0..<a.count {
        for j in 0..<a[i].count{
            sumMaxRoomCanStay += a[i][j]
        }
    }
    return sumMaxRoomCanStay
}
matrixElementsSum(matrix: [[0, 1, 1, 2],
                           [0, 5, 0, 0],
                           [2, 0, 3, 3]])

// lession 9:
func allLongestStrings(inputArray: [String]) -> [String] {
    var result: [String] = []
    var longest = 0
    
    for i in 0..<inputArray.count {
        if inputArray[i].count > longest {
            longest = inputArray[i].count
        }
        
    }
    for i in 0..<inputArray.count {
        if inputArray[i].count == longest {
            result.append(inputArray[i])
        }
    }
    
    return result
}
allLongestStrings(inputArray: ["aba", "aa", "ad", "vcd", "aba"])

// lession 10:
func commonCharacterCount(s1: String, s2: String) -> Int {
    var count = 0
    var arrS1 = Array(s1)
    var arrS2 = Array(s2)
    for i in 0..<arrS1.count {
        if let index = arrS2.firstIndex(of: arrS1[i]) {
            count += 1
            arrS2.remove(at: index)
        }
    }
    return count
}
commonCharacterCount(s1: "aabcc", s2: "adcaa")

// lession 11:
func isLucky(n: Int) -> Bool {
    let str = n.description
    let arr = Array(str)
    var firstSum = 0
    var endSum = 0
    if arr.count<2 {
        return false
    } else {
        let middle: Int = arr.count/2
       
        for i in 0..<arr.count {
            if i < middle {
                firstSum += Int(arr[i].description) ?? 0
            } else {
                endSum += Int(arr[i].description) ?? 0
            }
        }
        
    }

    return firstSum == endSum
}
isLucky(n: 1331)

// lession 12:
func sortByHeight(a: [Int]) -> [Int] {
    var answer = a
    var b = a.sorted()
    print(b)
    var j = 0
    
    while j < a.count && b[j] < 0 {
        
        j += 1
    }
    
    for i in 0..<a.count {
        if answer[i] >= 0 {
            answer[i] = b[j]
            j += 1
        }
    }
    
    return answer
}
sortByHeight(a: [-1, 150, 190, 170, -1, -1, 160, 180])

// lession 13:


// lession 14:
func alternatingSums(a: [Int]) -> [Int] {
    var result: [Int] = []
    var firstSum = 0
    var secondSum = 0
    if a.count == 1 {
        firstSum = a[0]
    } else {
        for i in 0..<a.count {
            if i % 2 == 0 {
                firstSum += a[i]
            } else {
                secondSum += a[i]
            }
        }
    }
    
    result = [firstSum, secondSum]
    
    return result
    
}
alternatingSums(a: [50, 60, 60, 45, 70])


// lession 15:
func addBorder(picture: [String]) -> [String] {
    var answer = picture[0].characters.count + 2
    var add = ""
    var arr: [String] = []
    
    for _ in 0..<answer {
        add += "*"
    }
    arr += [add]
    
    for i in 0..<picture.count {
        arr += ["*\(picture[i])*"]
    }
    
    return arr + [add]
}
addBorder(picture: ["abc",
                    "ded"])

// lession 16:
func areSimilar(a: [Int], b: [Int]) -> Bool {
    if a.count != b.count {
        return false
    }
    var count = 0
    var arr = [[0,0], [0,0]]
    for i in 0..<a.count {
        if a[i] != b[i] {
            count += 1
            if count > 2 {
                return false
            }
            arr[count-1][0] = a[i]
            arr[count-1][1] = b[i]
        }
    }
    
    return arr[0][1] == arr[1][0] && arr[0][0] == arr[1][1]
}
areSimilar(a: [1, 2, 3], b: [2, 1, 3])

// lession 17:
func arrayChange(inputArray: [Int]) -> Int {
    var arr = inputArray
    var count = 0
    for i in 1..<arr.count {
        if arr[i] <= arr[i-1] {
            count += arr[i-1] - arr[i] + 1
            arr[i] = arr[i-1] + 1
        }
    }
    
    return count
}
arrayChange(inputArray: [2, 1, 10, 1])

// lession 18: (chua xong)
func palindromeRearranging(inputString: String) -> Bool {
    let reverseString = String(inputString.characters.reversed())
    if(inputString != "" && inputString == reverseString) {
        return true
    } else {
        return false
        
    }
}
palindromeRearranging(inputString: "aabb")

// lession 19:
func areEquallyStrong(yourLeft: Int, yourRight: Int, friendsLeft: Int, friendsRight: Int) -> Bool {
    var firstArr: [Int] = [yourLeft, yourRight].sorted()
    var secondArr: [Int] = [friendsLeft, friendsRight].sorted()
    
    return firstArr == secondArr
}
areEquallyStrong(yourLeft: 10, yourRight: 20, friendsLeft: 20, friendsRight: 10)

// lession 20:
func arrayMaximalAdjacentDifference(inputArray: [Int]) -> Int {
    var max = 0
    for i in 1..<inputArray.count {
        var temp = abs(inputArray[i-1] - inputArray[i])
        if temp > max {
            max = temp
        }
    }
   
    return max
}
arrayMaximalAdjacentDifference(inputArray: [1, 2 ,3])

// lession 21: còn hidden test
func isIPv4Address(inputString: String) -> Bool {
    let arr = inputString.split(separator: ".")
    
    if arr.count != 4 {
        return false
    }
    
    for i in 0...3 {
        if let num = Int(arr[i]) {
            if num < 0 || num > 255 {
                return false
            }
        } else {
            return false
        }
    }
    return true
}
isIPv4Address(inputString: "172.316.254.1")


