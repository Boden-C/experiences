import Scenes
import Igis
import Foundation
  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {

      var didDraw = false
    
      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Background")
      }
      
      override func render(canvas:Canvas) {
          if let canvasSize = canvas.canvasSize, !didDraw {
              let turtle = Turtle(canvasSize:canvasSize)

              func polygon(sides:Int, length:Int) {
                  turtle.penDown()
                  for _ in 0..<sides {
                      turtle.right(degrees:Double(length))
                      turtle.forward(steps:length)
                  }
                  turtle.penUp()
              }

              func circle() {
                  turtle.penDown()
                  for _ in 1..<360 {
                      turtle.right(degrees:1)
                      turtle.forward(steps:1)
                  }
                  turtle.penUp()
              }

              func square(length:Int) {
                  turtle.penDown()
                  for _ in 1...4 {
                      turtle.forward(steps:length)
                      turtle.left(degrees:90)
                  }
                  turtle.penUp()
              }

              turtle.penUp()
              turtle.forward(steps:400)
              turtle.left(degrees:90)
              turtle.forward(steps:600)
              polygon(sides:5, length:72)

              turtle.left(degrees:90)
              turtle.forward(steps:100)
              polygon(sides:8, length:45)

              turtle.left(degrees:90)
              turtle.forward(steps:300)
              polygon(sides:9, length:40)

              turtle.right(degrees:90)
              turtle.forward(steps:300)
              polygon(sides:10, length:36)

              turtle.right(degrees:90)
              turtle.forward(steps:300)
              polygon(sides:15, length:24)

              turtle.left(degrees:90)
              turtle.forward(steps:300)
              circle()

              turtle.left(degrees:90)
              turtle.forward(steps:900)

              func house() {
                  square(length:500)
                  turtle.left(degrees:90)
                  turtle.forward(steps:500)
                  turtle.right(degrees:45.5)
                  
                  turtle.penDown()
                  turtle.forward(steps:353)
                  turtle.right(degrees:90)
                  turtle.forward(steps:353)
                  turtle.penUp()

                  turtle.right(degrees:45.5)
                  turtle.forward(steps:100)
                  turtle.right(degrees:90)
                  turtle.forward(steps:100)
                  square(length:100)
                  turtle.forward(steps:200)
                  square(length:100)

                  turtle.left(degrees:90)
                  turtle.forward(steps:400)
                  turtle.left(degrees:180) 
                  turtle.penDown()
                  turtle.forward(steps:200)
                  turtle.right(degrees:90) 
                  turtle.forward(steps:100)
                  turtle.right(degrees:90) 
                  turtle.forward(steps:200)
                  turtle.penUp()
              }
              house()
              
              canvas.render(turtle)
              didDraw = true
          }
      }        
}
