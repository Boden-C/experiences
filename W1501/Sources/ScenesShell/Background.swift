
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

    func renderRectangle(canvas:Canvas, rect:Rect) {
        let rectangle = Rectangle(rect:rect, fillMode:.stroke)
        canvas.render(rectangle)
    }

    
    func renderText(canvas:Canvas, x:Int, y:Int, text:String) {
        let text = Text(location:Point(x:x, y:y), text:text)
        text.font = "20pt Arial"
        canvas.render(text)
    }

    func renderColorRectangle(canvas:Canvas, rect:Rect, color:Color) {
        let rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
        let fillStyle = (color:Color(Color))
        let strokeStyle = (color:Color(Color))
        canvas.render(rectangle, fillStyle, strokeStyle)
    }

    
    func singleRectangle(canvas:Canvas) {
        renderText(canvas:canvas,x:20,y:40,text:"1.")

        let rect = Rect(topLeft:Point(x:20, y:50), size:Size(width:300, height:50))
        renderRectangle(canvas:canvas, rect:rect)
    }

    func row(canvas:Canvas, rect:Rect, columns:Int) {
        var rowRect = rect
        for _ in 0..<columns {
            renderRectangle(canvas:canvas, rect:rowRect)
            rowRect.topLeft.x += rowRect.size.width
        }
    }
    
    func grid(canvas:Canvas) {
        renderText(canvas:canvas,x:20,y:150,text:"2.")

        var rect = Rect(topLeft:Point(x:20, y:170), size:Size(width:50, height:50))
        for _ in 0..<3 {
            row(canvas:canvas, rect:rect, columns:3)
            rect.topLeft.y += rect.size.height
        }
    }
    
    func brickWall(canvas:Canvas) {
        renderText(canvas:canvas,x:20,y:380,text:"3.")

        var rect = Rect(topLeft:Point(x:20, y:390), size:Size(width:50, height:20))
        for _ in 0..<3 {
            row(canvas:canvas, rect:rect, columns:5)
            rect.topLeft.y += rect.size.height
            var sideRect = rect
            sideRect.size.width = 25
            renderRectangle(canvas:canvas, rect:sideRect)
            sideRect.topLeft.x += (rect.size.width)*4 + sideRect.size.width
            renderRectangle(canvas:canvas, rect:sideRect)
            rect.topLeft.x += (rect.size.width)/2
            row(canvas:canvas, rect:rect, columns:4)
            rect.topLeft.x -= (rect.size.width)/2
            rect.topLeft.y += rect.size.height
        }
    }

    func pyramid(canvas:Canvas) {
        renderText(canvas:canvas,x:20,y:550,text:"4.")

        var rect = Rect(topLeft:Point(x:20, y:750), size:Size(width:50, height:20))
        var base = 8
        for _ in 0..<8 {
            row(canvas:canvas, rect:rect, columns:base)
            rect.topLeft.y -= rect.size.height
                rect.topLeft.x += (rect.size.width)/2
            base -= 1
        }
    }
    
    func skyscraper(canvas:Canvas, rect:Rect, color:Color) {
        var signRect = rect
        renderColorRectangle(canvas:canvas, rect:rect, color:color)
        signRect.size.height = 60
        signRect.topLeft.y -= 60
        renderColorRectangle(canvas:canvas, rect:signRect, color:.white)
        renderText(canvas:canvas, x:(signRect.bottomLeft.x)+3, y:(signRect.bottomLeft.y)-30, text:"Boden Corp")
    }

    
        
    
    override func setup(canvasSize:Size,canvas:Canvas) {

        var rect = Rect(topLeft:Point(x:500, y:500), size:Size(width:150, height:300))
        skyscraper(canvas:canvas, rect:rect, color:.gray)
        
        rect.topLeft.x += 600
        rect.size.height = 423
        rect.topLeft.y -= 123
        skyscraper(canvas:canvas, rect:rect, color:.gold)
        rect.topLeft.x += 300
        rect.size.height = 250
        rect.topLeft.y += 173
        skyscraper(canvas:canvas, rect:rect, color:.violet)
        rect.topLeft.x += 300
        rect.size.height = 342
        rect.topLeft.y -= 92
        skyscraper(canvas:canvas, rect:rect, color:.red)
        
    }
}

