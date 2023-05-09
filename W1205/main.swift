let CountTest = false
let TempTest = false


if CountTest == true {

func repeatCount(_ count:Int) {
    for x in 1...count {
        print(x)
    }
}

repeatCount(_:10)
repeatCount(_:12)
repeatCount(_:20)
repeatCount(_:50)                            

}




if TempTest == true {

let temp_California = 90.0
let temp_Texas = 100.0
let temp_Alaska = 37.0
let temp_Maine = 55.0
let temp_NewYork = 72.0

func printTemp(state:String, temp:Double) {
    print("The temperature in \(state) in C is: ")
    print((temp - 32)*(5 / 9))
}

printTemp(state:"California", temp:temp_California)
printTemp(state:"Texas", temp:temp_Texas)
printTemp(state:"Alaska", temp:temp_Alaska)
printTemp(state:"Maine", temp:temp_Maine)
printTemp(state:"New York", temp:temp_NewYork)

}
