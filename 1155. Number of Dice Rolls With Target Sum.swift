class Solution {

    // 1155. Number of Dice Rolls With Target Sum
    // You have d dice and each die has f faces numbered 1, 2, ..., f.
    // Return the number of possible ways (out of fd total ways) modulo 10^9 + 7 to roll the dice so the sum of the face-up numbers equals target.

    // Example 1:
    // Input: d = 1, f = 6, target = 3
    // Output: 1
    // Explanation: 
    // You throw one die with 6 faces.  There is only one way to get a sum of 3.

    // Example 2:
    // Input: d = 2, f = 6, target = 7
    // Output: 6
    // Explanation: 
    // You throw two dice, each with 6 faces.  There are 6 ways to get a sum of 7:
    // 1+6, 2+5, 3+4, 4+3, 5+2, 6+1.

    // Example 3:
    // Input: d = 2, f = 5, target = 10
    // Output: 1
    // Explanation: 
    // You throw two dice, each with 5 faces.  There is only one way to get a sum of 10: 5+5.

    // Example 4:
    // Input: d = 1, f = 2, target = 3
    // Output: 0
    // Explanation: 
    // You throw one die with 2 faces.  There is no way to get a sum of 3.

    // Example 5:
    // Input: d = 30, f = 30, target = 500
    // Output: 222616187
    // Explanation: 
    // The answer must be returned modulo 10^9 + 7.

    // Constraints:
    // 1 <= d, f <= 30
    // 1 <= target <= 1000

    func numRollsToTarget(_ d: Int, _ f: Int, _ target: Int) -> Int {
        let size = d * f
        if target > size { return 0 }
        var array = [Int](repeating: 0, count: size + 1)
        
        for i in 1...d {
            let temp = array
            for j in i...i * f {
                if i == 1 {
                    array[j] = 1
                } else {
                    var sum = 0
                    for index in 1...f {
                        let diff = j - index
                        if diff > 0 && diff >= i - 1 { sum += temp[diff] }
                    }
                    array[j] = sum%1000000007
                }
            }
        }
        
        return array[target]
    }

}