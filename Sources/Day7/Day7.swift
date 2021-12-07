import Algorithms

public func partOne() {
    let startingPositions = input.split(separator: ",").map{ Int($0)! }
    print(bestPosition(with: startingPositions))
}

func fuelCost(for targetPosition: Int, with positions: [Int]) -> Int {
    positions.reduce(0) { partialResult, currentPosition in
        partialResult + abs(currentPosition - targetPosition)
    }
}

func bestPosition(with positions: [Int]) -> Int {
    let min = positions.min()!
    let max = positions.max()!

    let best = (min...max).reduce((position: -1, cost: Int.max)) { partialResult, i in
        let cost = fuelCost(for: i, with: positions)
        if cost < partialResult.cost {
            return (position: i, cost: cost)
        } else {
            return partialResult
        }
    }

    return best.cost
}

public func partTwo() {

}
