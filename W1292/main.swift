import Foundation

func estimate_pi(n:Int) -> Double {

    var circle = 1
    
    for _ in 1...n {
        
        let x = Double.random(in:0...1)
        let y = Double.random(in:0...1)

        let land = ((x*x) + (y*y)).squareRoot()
        if Bool(land <= 1.0) {
            circle += 1
        }
    }
    return (Double(circle)/Double(n))*4.0

}
                
print(estimate_pi(n:10))
