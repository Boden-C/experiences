import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {

    private var didRender = false
    private var generationCount = 1
    private var stepCount = 20
    private var LSystemDigit = 1
    private let increment = 5

    private let colors = [Color(.black), Color(.red), Color(.orange), Color(.green), Color(.blue)]
    private var colorIndex = 0

    init() {
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Background")
    }
    
    func moveTurtleForKochCurve(turtle:Turtle, generationCount:Int, steps:Int, color: Color) {
        turtle.penColor(color:color)
        // Create the LSystem
        let alphabet = Set<Character>(["F", "X", "[", "]", "+", "-", "0", "1", "2", "3"])
        let axiom = "FX"
        let productionRules:[Character:String] = ["F":"0FF-[1-F+F]+[2+F-F]","X":"0FF+[1+F]+[3-F]"]

        let lSystem = LSystem(axiom:axiom, rules:productionRules, alphabet:alphabet)
        let production = lSystem.generate(generationCount)

        // Map the LSystem to turtle graphics
        for letter in production {
            switch (letter) {
            case "F":
                turtle.forward(steps:steps)
            case "X":
                turtle.forward(steps:steps)
                case "-":
                turtle.left(degrees:25)
            case "+":
                turtle.right(degrees:25)
            case "[":
                turtle.push()
            case "]":
                turtle.pop()
            case "0":
                turtle.penColor(color:Color(red:140, green:80, blue:60))
            case "1":
                turtle.penColor(color:Color(red:24, green:180, blue:24))
            case "2":
                turtle.penColor(color:Color(red:48, green:220, blue:48))
            case "3":
                turtle.penColor(color:Color(red:64, green:255, blue:64))
            
            default:
                fatalError("Unexepected letter '\(letter)' in production.")
            }
        }
    }

    func moveTurtleOne(turtle:Turtle, generationCount:Int, steps:Int, color: Color) {
        turtle.penColor(color:color)
        // Create the LSystem
        let alphabet = Set<Character>(["0", "1", "[","]"])
        let axiom = "0"
        let productionRules:[Character:String] = ["1":"11","0":"1[0]0"]

        let lSystem = LSystem(axiom:axiom, rules:productionRules, alphabet:alphabet)
        let production = lSystem.generate(generationCount)

        // Map the LSystem to turtle graphics
        for letter in production {
            switch (letter) {
            case "0":
                turtle.penColor(color:Color(.green))
                turtle.forward(steps:steps)
            case "1":
                turtle.forward(steps:steps)
            case "[":
                turtle.push()
                turtle.left(degrees:45)
            case "]":
                turtle.pop()
                turtle.right(degrees:45)
            default:
                fatalError("Unexepected letter '\(letter)' in production.")
            }
        }
    }

    func moveTurtleTwo(turtle:Turtle, generationCount:Int, steps:Int, color: Color) {
        turtle.penColor(color:color)
        // Create the LSystem
        let alphabet = Set<Character>(["X", "F", "+","-","[","]"])
        let axiom = "X"
        let productionRules:[Character:String] = ["X":"F+[[X]-X]-F[-FX]+X","F":"FF"]

        let lSystem = LSystem(axiom:axiom, rules:productionRules, alphabet:alphabet)
        let production = lSystem.generate(generationCount)

        // Map the LSystem to turtle graphics
        for letter in production {
            switch (letter) {
            case "X":
                turtle.penColor(color:Color(.green))
                turtle.forward(steps:steps)
            case "F":
                turtle.forward(steps:steps)
            case "+":
                turtle.left(degrees:25)
            case "-":
                turtle.right(degrees:25)
            case "[":
                turtle.push()
            case "]":
                turtle.pop()
            default:
                fatalError("Unexepected letter '\(letter)' in production.")
            }
        }
    }

    public func incrementGenerationCount() {
        generationCount += 1
        didRender = false
    }

    public func decreaseGenerationCount() {
        guard generationCount == 1 else {
            generationCount -= 1
            didRender = false
            return
        }
    }

    public func increaseStepCount() {
        stepCount += increment
        didRender = false
    }

    public func decreaseStepCount() {
        guard stepCount == increment else {
            stepCount -= increment
            didRender = false
            return
        }
    }

    public func cycleLSystems() {
        if LSystemDigit == 3 {
            LSystemDigit = 1
            didRender = false
        }
        else {
            LSystemDigit += 1
            didRender = false
        }
    }

    public func cycleColors() {
        if  colorIndex == 4 {
            colorIndex = 0
            didRender = false
        }
        else {
            colorIndex += 1
            didRender = false
        }
    }

    override func render(canvas:Canvas) {
        if let canvasSize = canvas.canvasSize, !didRender {

            clearCanvas(canvas:canvas)

            let turtle = Turtle(canvasSize:canvasSize)
            turtle.penUp()
            turtle.backward(steps:canvasSize.height/2)
            turtle.penDown()

            switch LSystemDigit {
            case 1:
                moveTurtleForKochCurve(turtle:turtle, generationCount: generationCount, steps: stepCount, color: colors[colorIndex])
            case 2:
                moveTurtleOne(turtle:turtle, generationCount: generationCount, steps: stepCount, color: colors[colorIndex])
            case 3:
                moveTurtleTwo(turtle:turtle, generationCount:generationCount, steps:stepCount, color: colors[colorIndex])
            default:
                fatalError("\(LSystemDigit) is greater than the maximum allowed")
            }



            //moveTurtleForKochCurve(turtle:turtle, generationCount: generationCount, steps: stepCount)

            canvas.render(turtle)

            didRender = true
        }
    }

    func clearCanvas(canvas:Canvas) {
        if let canvasSize = canvas.canvasSize {
            let canvasRect = Rect(topLeft:Point(), size:canvasSize)
            let canvasClearRectangle = Rectangle(rect:canvasRect, fillMode:.clear)
            canvas.render(canvasClearRectangle)
        }
    } 
    
}
