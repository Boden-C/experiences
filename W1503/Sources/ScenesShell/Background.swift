import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {

    
      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Background")
      }

      func renderText(canvas:Canvas, x:Int, y:Int, text:String) {
          let text = Text(location:Point(x:x, y:y), text:text)
          text.font = "20pt Arial"
          canvas.render(text)
      }

      func renderColorRectangle(canvas:Canvas, rect:Rect, fillColor:Color, strokeColor:Color) {
          let fillStyle = FillStyle(color:fillColor)
          let strokeStyle = StrokeStyle(color:strokeColor)
          let rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
          canvas.render(fillStyle, strokeStyle, rectangle)
      }

      func row(canvas:Canvas, rect:Rect, columns:Int) {
          var rowRect = rect
          for _ in 0..<columns {
              renderColorRectangle(canvas:canvas, rect:rowRect, fillColor:Color(.green), strokeColor:Color(.darkgreen))
              rowRect.topLeft.x += rowRect.size.width
          }
      }

      func pyramid(canvas:Canvas) {
          var rect = Rect(topLeft:Point(x:768, y:485), size:Size(width:55, height:35))
          var base = 8
          for _ in 0..<4 {
              row(canvas:canvas, rect:rect, columns:base)
              rect.topLeft.y -= rect.size.height
              rect.topLeft.x += (rect.size.width)/2
              base -= 1
          }
      }

      func triangle(canvas:Canvas) {
          let strokeStyle = StrokeStyle(color:Color(.springgreen))
          let triangle = Lines(from:Point(x:875, y:350), to:Point(x:1100, y:350))
          triangle.lineTo(Point(x:988, y:250))
          triangle.lineTo(Point(x:875, y:350))
          canvas.render(strokeStyle, triangle)
      }

      func renderColorEllipse(canvas:Canvas, X:Int, Y:Int, fillColor:Color, strokeColor:Color) {
          let ellipse = Ellipse(center:Point(x:988, y:315), radiusX:X, radiusY:Y, fillMode:.fillAndStroke)
          let strokeStyle = StrokeStyle(color:strokeColor)
          let fillStyle = FillStyle(color:fillColor)
          canvas.render(strokeStyle, fillStyle, ellipse)
      }

      func eye(canvas:Canvas) {
          renderColorEllipse(canvas:canvas, X:60, Y:20, fillColor:Color(.white), strokeColor:Color(.black))
          renderColorEllipse(canvas:canvas, X:30, Y:15, fillColor:Color(.violet), strokeColor:Color(.violet))
          renderColorEllipse(canvas:canvas, X:8, Y:5, fillColor:Color(.black), strokeColor:Color(.black))
      }
          
      override func setup(canvasSize:Size, canvas:Canvas) {
          pyramid(canvas:canvas)
          triangle(canvas:canvas)
          eye(canvas:canvas)
      }
}

