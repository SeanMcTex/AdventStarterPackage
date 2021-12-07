import Algorithms

typealias FuelUseFunction = (Int, Int) -> Int
let startingPositions = input.split(separator: ",").map{ Int($0)! }
let min = startingPositions.min()!
let max = startingPositions.max()!

public func partOne() {
    print(bestPosition(with: startingPositions, fuelUse: { abs($0 - $1) }))
}

func fuelCost(for targetPosition: Int, with positions: [Int], fuelUse: FuelUseFunction) -> Int {
    positions.reduce(0) { partialResult, currentPosition in
        partialResult + fuelUse(currentPosition, targetPosition)
    }
}

func bestPosition(with positions: [Int], fuelUse: FuelUseFunction) -> Int {

    let best = (min...max).reduce((position: -1, cost: Int.max)) { partialResult, i in
        print("\(Float(i)/Float(max)) completed")
        let cost = fuelCost(for: i, with: positions, fuelUse: fuelUse)
        if cost < partialResult.cost {
            return (position: i, cost: cost)
        } else {
            return partialResult
        }
    }

    return best.cost
}

public func partTwo() {
    let maxDistance = max - min
    let lookupTable: [Int] = (0...maxDistance).map { i in
        guard i > 0 else { return 0}
        var tally = 0
        (1...i).forEach { tally += $0 }
        return tally
    }

    print(
        bestPosition(
            with: startingPositions,
            fuelUse: {
                lookupTable[ abs($0 - $1) ]
            }
        )
    )
}
