class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack: [Int] = []

        for token in tokens {
            switch token {
                case "+":
                    let val = stack.removeLast() + stack.removeLast()
                    stack.append(val)
                case "-":
                    let a = stack.removeLast()
                    let b = stack.removeLast()
                    stack.append(b - a)
                case "*":
                    let val = stack.removeLast() * stack.removeLast()
                    stack.append(val)
                case "/":
                    let a = stack.removeLast()
                    let b = stack.removeLast()
                    stack.append(b / a)
                default:
                    stack.append(Int(token)!)
            }
        }

        return stack[0]
    }
}
