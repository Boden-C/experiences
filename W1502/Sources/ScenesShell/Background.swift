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
          let fillStyle = FillStyle(color:Color(.black))
          let strokeStyle = StrokeStyle(color:Color(.black))
          let text = Text(location:Point(x:x, y:y), text:text)
          text.font = "20pt Arial"
          canvas.render(fillStyle, strokeStyle, text)
      }

      func renderColorRectangle(canvas:Canvas, rect:Rect, color:Color) {
          let fillStyle = FillStyle(color:color)
          let strokeStyle = StrokeStyle(color:color)
          let rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
          canvas.render(fillStyle, strokeStyle, rectangle)
      }
      
      func skyscraper(canvas:Canvas, rect:Rect, color:Color) {
          var signRect = rect
          renderColorRectangle(canvas:canvas, rect:rect, color:color)
          signRect.size.height = 60
          signRect.topLeft.y -= 60
          renderColorRectangle(canvas:canvas, rect:signRect, color:Color(.white))
          renderText(canvas:canvas, x:(signRect.bottomLeft.x)+3, y:(signRect.bottomLeft.y)-30, text:"Boden Corp")
          let doorRect = Rect(topLeft:Point(x:(rect.topLeft.x)+(rect.size.width)-50,y:(rect.topLeft.y)+(rect.size.height)-50), size:Size(width:25, height:50))
          renderColorRectangle(canvas:canvas, rect:doorRect, color:Color(.brown))
          var windowRect = Rect(topLeft:Point(x:(rect.topLeft.x)+10,y:doorRect.topLeft.y), size:Size(width:80, height:17))
          for _ in 1..<(rect.size.height)/40 {
              renderColorRectangle(canvas:canvas, rect:windowRect, color:Color(.white))
              windowRect.topLeft.y -= 40
          }
      }

      override func setup(canvasSize:Size, canvas:Canvas) {
          let skyRect = Rect(topLeft:Point(x:0, y:0), size:Size(width:9000, height:650))
          renderColorRectangle(canvas:canvas, rect:skyRect, color:Color(.blue))

          let grassRect = Rect(topLeft:Point(x:0, y:650), size:Size(width:9000, height:100))
          renderColorRectangle(canvas:canvas, rect:grassRect, color:Color(.green))

          let dirtRect = Rect(topLeft:Point(x:0, y:750), size:Size(width:9000, height:900))
          renderColorRectangle(canvas:canvas, rect:dirtRect, color:Color(.brown))
          
          var rect = Rect(topLeft:Point(x:500, y:350), size:Size(width:150, height:300))
          skyscraper(canvas: canvas, rect:rect, color:Color(.gray))
          
          rect.topLeft.x += 600
          rect.size.height = 423
          rect.topLeft.y -= 123
          skyscraper(canvas: canvas, rect:rect, color:Color(.gold))
          rect.topLeft.x += 300
          rect.size.height = 250
          rect.topLeft.y += 173
          skyscraper(canvas: canvas, rect:rect, color:Color(.violet))
          rect.topLeft.x += 300
          rect.size.height = 342
          rect.topLeft.y -= 92
          skyscraper(canvas:canvas, rect:rect, color:Color(.red))
      }
}
