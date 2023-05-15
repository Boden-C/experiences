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
    func renderSquare(turtle: Turtle, color: Color, width: Int) {
        turtle.penColor(color:color)
        for _ in 1 ... 9 {
            turtle.forward(steps: width)
            turtle.right(degrees: 280)
        }
    }
    override func render(canvas:Canvas) {
        
        if let canvasSize = canvas.canvasSize, !didDraw {

            let skyRect = Rect(topLeft:Point(x:0, y:0), size:Size(width:9000, height:9000))
            Rect(topLeft:Point(x:0, y:0), size:Size(width:9000, height:9000))
            let fillStyle = FillStyle(color:Color(.gray))
            let strokeStyle = StrokeStyle(color:Color(.gray))
            let rectangle = Rectangle(rect:skyRect, fillMode:.fillAndStroke)
            canvas.render(fillStyle, strokeStyle, rectangle)  
            
            let pupil = Ellipse(center:Point(x:500, y:500), radiusX:1000, radiusY:1000, fillMode:.fill)
            let pupilFillColor = FillStyle(color:Color(red:40, green:26, blue:13))
            canvas.render(pupilFillColor, pupil)
            
            
              let turtle = Turtle(canvasSize:canvasSize)
              let colors = [Color(.skyblue), Color(.cyan), Color(.blue), Color(.darkblue)]
              var colorIndex = 0
              for i in 1 ... 50 {
                  let width = i * 10
                  let color = colors[colorIndex]
                  renderSquare(turtle:turtle, color:color, width:width)
                  colorIndex = (colorIndex + 1) % colors.count
                  turtle.right(degrees:5)
              }
              canvas.render(turtle)

              didDraw = true
          }
          }
      }   
