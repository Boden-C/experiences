import Scenes
import Igis
  /*
                                                                                                           This class is responsible for rendering the background.
   */
class Background : RenderableEntity, EntityMouseClickHandler {

    let maxPattern = 9
    var currentPattern = 1
    var didRender = false
    var rect: Rect?
    init() {

        // Using a meaningful name can be helpful for debugging
        super.init(name:"Background")
    }

    func renderRectangle(canvas:Canvas, rect:Rect) {
        let rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
        canvas.render(rectangle)
    }

    func renderRectangle2(canvas:Canvas, rect:Rect) {
        let rectangle = Rectangle(rect:rect, fillMode:.stroke)
        canvas.render(rectangle)
    }

    func rectRow(canvas:Canvas, rect:Rect, c:Int) {
        var d = rect
        for _ in 0 ..< c {
            renderRectangle(canvas:canvas, rect:d)
            d.topLeft.x += d.size.width
        }
    }

    func rectRow2(canvas:Canvas, rect:Rect, c:Int) {
        var d = rect
        for _ in 0 ..< c {
            renderRectangle2(canvas:canvas, rect:d)
            d.topLeft.x += d.size.width
        }
    }

    func renderLabel(canvas:Canvas, patternId:Int) {
        let text = Text(location:Point(x:15, y:40), text:"\(patternId).")
        text.font = "30pt Arial"
        canvas.render(FillStyle(color:Color(.black)))
        canvas.render(text)
    }
    func ellipses(canvas:Canvas) {
        let magenta = StrokeStyle(color:Color(.magenta))
        let purple = FillStyle(color:Color(.purple))
        canvas.render(purple, magenta)
        let ellipse = Ellipse(center:Point(x:500, y:150), radiusX:15, radiusY:30, fillMode:.fillAndStroke)
        for _ in 0 ..< 6 {
            for _ in 0 ..< 10 {
                canvas.render(ellipse)
                ellipse.center.x += ellipse.radiusX*2
            }
            ellipse.center.x = 500
            ellipse.center.y += ellipse.radiusY*2
        }
    }
    func ellipses2(canvas:Canvas) {
        var number = 0
        let ellipse1 = Ellipse(center:Point(x:500, y:150), radiusX:15, radiusY:30, fillMode:.fillAndStroke)
        let rect2 = Rect(topLeft:Point(x:500, y:150), size:Size(width:175, height:350))
        let rectangle2 = Rectangle(rect:rect2)
        let fillStyle2 = FillStyle(color:Color(.blue))
        canvas.render(fillStyle2, rectangle2)
        let ellipse5 = Ellipse(center:Point(x:500+(ellipse1.radiusX*6), y:325), radiusX:40, radiusY:200, fillMode:.fill)
        let fillStyle4 = FillStyle(color:Color(.blue))
        canvas.render(fillStyle4, ellipse5)
        let ellipse6 = Ellipse(center:Point(x:500+(ellipse1.radiusX*6), y:320), radiusX:110, radiusY:40, fillMode:.fill)
        canvas.render(ellipse6)
        for _ in 0 ..< 2 {
            let rect = Rect(topLeft:Point(x:500+number, y:150), size:Size(width:65, height:125))
            let rectangle = Rectangle(rect:rect)
            let fillStyle = FillStyle(color:Color(.orange))
            canvas.render(fillStyle, rectangle)
            let rect2 = Rect(topLeft:Point(x:500, y:150), size:Size(width:150, height:500))
            let magenta = StrokeStyle(color:Color(.magenta))
            let purple = FillStyle(color:Color(.purple))
            canvas.render(purple, magenta)
            number += ellipse1.radiusX*8
        }
        for _ in 0 ..< 3 {
            for _ in 0 ..< 3 {
                canvas.render(ellipse1)
                ellipse1.center.x += ellipse1.radiusX*2
            }
            ellipse1.center.x = 500
            ellipse1.center.y += ellipse1.radiusY*2
        }
        let ellipse2 = Ellipse(center:Point(x:500+(ellipse1.radiusX*8), y:150), radiusX:15, radiusY:30, fillMode:.fillAndStroke)
        for _ in 0 ..< 3 {
            for _ in 0 ..< 3 {
                canvas.render(ellipse2)
                ellipse2.center.x += ellipse2.radiusX*2
            }
            ellipse2.center.x = 500+(ellipse1.radiusX*8)
            ellipse2.center.y += ellipse2.radiusY*2
        }
        var number2 = 0
        let ellipse3 = Ellipse(center:Point(x:500, y:370), radiusX:15, radiusY:30, fillMode:.fillAndStroke)
        for _ in 0 ..< 2 {
            let rect3 = Rect(topLeft:Point(x:500+number2, y:370), size:Size(width:65, height:125))
            let rectangle3 = Rectangle(rect:rect3)
            let fillStyle3 = FillStyle(color:Color(.orange))
            canvas.render(fillStyle3, rectangle3)
            number2 += ellipse3.radiusX*8
        }
        let magenta2 = StrokeStyle(color:Color(.magenta))
        let purple2 = FillStyle(color:Color(.purple))
        canvas.render(purple2, magenta2)
        for _ in 0 ..< 3 {
            for _ in 0 ..< 3 {
                canvas.render(ellipse3)
                ellipse3.center.x += ellipse3.radiusX*2
            }
            ellipse3.center.x = 500
            ellipse3.center.y += ellipse3.radiusY*2
        }
        let ellipse4 = Ellipse(center:Point(x:500+(ellipse3.radiusX*8), y:370), radiusX:15, radiusY:30, fillMode:.fillAndStroke)
        for _ in 0 ..< 3 {
            for _ in 0 ..< 3 {
                canvas.render(ellipse4)
                ellipse4.center.x += ellipse4.radiusX*2
            }
            ellipse4.center.x = 500+(ellipse3.radiusX*8)
            ellipse4.center.y += ellipse4.radiusY*2
        }
    }
    func ellipses3(canvas:Canvas) {
        var number = 0
        let ellipse1 = Ellipse(center:Point(x:500, y:150), radiusX:15, radiusY:30, fillMode:.fillAndStroke)
        let rect2 = Rect(topLeft:Point(x:500, y:150), size:Size(width:175, height:350))
        let rectangle2 = Rectangle(rect:rect2)
        let fillStyle2 = FillStyle(color:Color(.white))
        canvas.render(fillStyle2, rectangle2)
        let ellipse5 = Ellipse(center:Point(x:500+(ellipse1.radiusX*6), y:325), radiusX:40, radiusY:200, fillMode:.fill)
        let fillStyle4 = FillStyle(color:Color(.blue))
        canvas.render(fillStyle4, ellipse5)
        let ellipse6 = Ellipse(center:Point(x:500+(ellipse1.radiusX*6), y:320), radiusX:110, radiusY:40, fillMode:.fill)
        canvas.render(ellipse6)
        for _ in 0 ..< 2 {
            let rect = Rect(topLeft:Point(x:500+number, y:150), size:Size(width:65, height:125))
            let rectangle = Rectangle(rect:rect)
            let fillStyle = FillStyle(color:Color(.white))
            canvas.render(fillStyle, rectangle)
            let rect2 = Rect(topLeft:Point(x:500, y:150), size:Size(width:150, height:500))
            let magenta = StrokeStyle(color:Color(.white))
            let purple = FillStyle(color:Color(.white))
            canvas.render(purple, magenta)
            number += ellipse1.radiusX*8
        }
        for _ in 0 ..< 3 {
            for _ in 0 ..< 3 {
                canvas.render(ellipse1)
                ellipse1.center.x += ellipse1.radiusX*2
            }
            ellipse1.center.x = 500
            ellipse1.center.y += ellipse1.radiusY*2
        }
        let ellipse2 = Ellipse(center:Point(x:500+(ellipse1.radiusX*8), y:150), radiusX:15, radiusY:30, fillMode:.fillAndStroke)
        for _ in 0 ..< 3 {
            for _ in 0 ..< 3 {
                canvas.render(ellipse2)
                ellipse2.center.x += ellipse2.radiusX*2
            }
            ellipse2.center.x = 500+(ellipse1.radiusX*8)
            ellipse2.center.y += ellipse2.radiusY*2
        }
        var number2 = 0
        let ellipse3 = Ellipse(center:Point(x:500, y:370), radiusX:15, radiusY:30, fillMode:.fillAndStroke)
        for _ in 0 ..< 2 {
            let rect3 = Rect(topLeft:Point(x:500+number2, y:370), size:Size(width:65, height:125))
            let rectangle3 = Rectangle(rect:rect3)
            let fillStyle3 = FillStyle(color:Color(.white))
            canvas.render(fillStyle3, rectangle3)
            number2 += ellipse3.radiusX*8
        }
        let magenta2 = StrokeStyle(color:Color(.white))
        let purple2 = FillStyle(color:Color(.white))
        canvas.render(purple2, magenta2)
        for _ in 0 ..< 3 {
            for _ in 0 ..< 3 {
                canvas.render(ellipse3)
                ellipse3.center.x += ellipse3.radiusX*2
            }
            ellipse3.center.x = 500
            ellipse3.center.y += ellipse3.radiusY*2
        }
        let ellipse4 = Ellipse(center:Point(x:500+(ellipse3.radiusX*8), y:370), radiusX:15, radiusY:30, fillMode:.fillAndStroke)
        for _ in 0 ..< 3 {
            for _ in 0 ..< 3 {
                canvas.render(ellipse4)
                ellipse4.center.x += ellipse4.radiusX*2
            }
            ellipse4.center.x = 500+(ellipse3.radiusX*8)
            ellipse4.center.y += ellipse4.radiusY*2
        }
    }
    func triangles(canvas:Canvas) {
        let triangle = Path(fillMode:.fillAndStroke)
        var move1 = 150
        var move2 = 175
        var move3 = 125
        var y1 = 225
        var y2 = 175
        let fillStyle = FillStyle(color:Color(.green))
        for _ in 0 ..< 10  {
            for _ in 0 ..< 10 {
                triangle.moveTo(Point(x:move1, y:y2))
                triangle.lineTo(Point(x:move2, y:y1))
                triangle.lineTo(Point(x:move3, y:y1))
                triangle.lineTo(Point(x:move1, y:y2))
                canvas.render(fillStyle, triangle)
                move1 += 50
                move2 += 50
                move3 += 50

            }
            y1 += 50
            y2 += 50
            move1 -= 500
            move2 -= 500
            move3 -= 500
        }
    }
    func triangles2(canvas:Canvas) {
        let triangle = Path(fillMode:.fillAndStroke)
        var move1 = 125
        var move2 = 150
        var move3 = 100
        var y1 = 175
        var y2 = 225
        let fillStyle = FillStyle(color:Color(.green))
        for _ in 0 ..< 10  {
            for _ in 0 ..< 10 {
                triangle.moveTo(Point(x:move1, y:y2))
                triangle.lineTo(Point(x:move2, y:y1))
                triangle.lineTo(Point(x:move3, y:y1))
                triangle.lineTo(Point(x:move1, y:y2))
                canvas.render(fillStyle, triangle)
                move1 += 50
                move2 += 50
                move3 += 50
            }
            y1 += 50
            y2 += 50
            move1 -= 500
            move2 -= 500
            move3 -= 500
        }
    }
    func triangles3(canvas:Canvas) {
        let triangle = Path(fillMode:.fillAndStroke)
        var move1 = 150
        var move2 = 175
        var move3 = 125
        var y1 = 225
        var y2 = 175
        let fillStyle = FillStyle(color:Color(.blue))
        for _ in 0 ..< 10  {
            for _ in 0 ..< 10 {
                triangle.moveTo(Point(x:move1, y:y2))
                triangle.lineTo(Point(x:move2, y:y1))
                triangle.lineTo(Point(x:move3, y:y1))
                triangle.lineTo(Point(x:move1, y:y2))
                canvas.render(fillStyle, triangle)
                move1 += 50
                move2 += 50
                move3 += 50
            }
            y1 += 50
            y2 += 50
            move1 -= 500
            move2 -= 500
            move3 -= 500
        }
    }
    func triangles4(canvas:Canvas) {
        let colors = [Color(.green), Color(.red), Color(.blue)]
        var i = 0
        var move1 = 125
        var move2 = 150
        var move3 = 100
        var y1 = 175
        var y2 = 225
        var x = 0
        var color = colors[i]
        var fillStyle = (FillStyle(color:color))
        for _ in 0 ..< 10 {
            for _ in 0 ..< 10 {
                if x == 0 {
                    fillStyle = (FillStyle(color:Color(.green)))
                }
                if x == 1 {
                    fillStyle = (FillStyle(color:Color(.red)))
                }
                if x == 2 {
                    fillStyle = (FillStyle(color:Color(.blue)))
                }
                canvas.render(fillStyle)
                let triangle = Path(fillMode:.fill)
                triangle.moveTo(Point(x:move1, y:y2))
                triangle.lineTo(Point(x:move2, y:y1))
                triangle.lineTo(Point(x:move3, y:y1))
                triangle.lineTo(Point(x:move1, y:y2))
                canvas.render(triangle)
                move1 += 50
                move2 += 50
                move3 += 50
                x = (x+1)%3
            }
            y1 += 50
            y2 += 50
            move1 -= 500
            move2 -= 500
            move3 -= 500
        }
    }   
    func triangles5(canvas:Canvas) {
        let colors = [Color(.blue), Color(.green), Color(.red)]
        var i = 0
        var move1 = 150
        var move2 = 175
        var move3 = 125
        var y1 = 225
        var y2 = 175
        var x = 0
        var color = colors[i]
        var fillStyle = (FillStyle(color:color))
        for _ in 0 ..< 10 {
            if x == 0 {
                fillStyle = (FillStyle(color:Color(.blue)))
            }
            if x == 1 {
                fillStyle = (FillStyle(color:Color(.green)))
            }
            for _ in 0 ..< 10 {
                if x == 0 {
                    fillStyle = (FillStyle(color:Color(.blue)))
                }
                if x == 1 {
                    fillStyle = (FillStyle(color:Color(.green)))
                }
                if x == 2 {
                    fillStyle = (FillStyle(color:Color(.red)))
                }
                canvas.render(fillStyle)
                let triangle = Path(fillMode:.fill)
                triangle.moveTo(Point(x:move1, y:y2))
                triangle.lineTo(Point(x:move2, y:y1))
                triangle.lineTo(Point(x:move3, y:y1))
                triangle.lineTo(Point(x:move1, y:y2))
                canvas.render(triangle)
                move1 += 50
                move2 += 50
                move3 += 50
                x = (x+1)%3
            }
            y1 += 50
            y2 += 50
            move1 -= 500
            move2 -= 500
            move3 -= 500
        }
    }
    
    func renderPattern1(canvas:Canvas) {
        renderLabel(canvas:canvas, patternId:1)
        let strokeStyle = StrokeStyle(color:Color(.black))
        canvas.render(strokeStyle)
        var rect = Rect(topLeft:Point(x:50, y:150), size:Size(width:50, height:100))
        for _ in 0 ..< 6         {
            rectRow2(canvas:canvas, rect:rect, c:10)
            rect.topLeft.y += rect.size.height
        }
    }
    func renderPattern2(canvas:Canvas) {
        renderLabel(canvas:canvas, patternId:2)
        let gray = StrokeStyle(color:Color(.darkgray))
        let darkred = FillStyle(color:Color(.darkred))
        let linewidth = LineWidth(width:3)
        canvas.render(darkred, gray, linewidth)
        var rect = Rect(topLeft:Point(x:50, y:150), size:Size(width:50, height:20))
        for _ in 0 ..< 7 {
            rectRow(canvas:canvas, rect:rect, c:10)
            rect.topLeft.y += rect.size.height
            var side = rect
            side.size.width = 25
            renderRectangle(canvas:canvas, rect:side)
            side.topLeft.x += (rect.size.width)*9 + side.size.width
            renderRectangle(canvas:canvas, rect:side)
            rect.topLeft.x += (rect.size.width)/2
            rectRow(canvas:canvas, rect:rect, c:9)
            rect.topLeft.x -= (rect.size.width)/2
            rect.topLeft.y += rect.size.height
        }
        rectRow(canvas:canvas, rect:rect, c:10)
    }
    func renderPattern3(canvas:Canvas) {
        renderLabel(canvas:canvas, patternId:3)
        triangles(canvas:canvas)
        triangles2(canvas:canvas)
    }

    func renderPattern4(canvas:Canvas) {
        renderLabel(canvas:canvas, patternId:4)
        triangles2(canvas:canvas)
        triangles3(canvas:canvas)
    }
    func renderPattern5(canvas:Canvas) {
        renderLabel(canvas:canvas, patternId:5)
        triangles4(canvas:canvas)
        triangles5(canvas:canvas)
    }
    func renderPattern6(canvas:Canvas) {
        renderLabel(canvas:canvas, patternId:6)
        ellipses(canvas:canvas)
    }
    func renderPattern7(canvas:Canvas) {
        renderLabel(canvas:canvas, patternId:7)
        let rect = Rect(topLeft:Point(x:500, y:150), size:Size(width:275, height:300))
        let rectangle = Rectangle(rect:rect)
        let fillStyle = FillStyle(color:Color(.orange))
        canvas.render(fillStyle, rectangle)
        ellipses(canvas:canvas)
    }
    func renderPattern8(canvas:Canvas) {
        renderLabel(canvas:canvas, patternId:8)
        ellipses2(canvas:canvas)
    }

    func renderPattern9(canvas:Canvas) {
        renderLabel(canvas:canvas, patternId:9)
        ellipses3(canvas:canvas)
    }
    func onEntityMouseClick(globalLocation:Point) {
        currentPattern += 1
        if (currentPattern > maxPattern) {
            currentPattern = 1
        }
        didRender = false
    }
    override func render(canvas:Canvas) {
        if let canvasSize = canvas.canvasSize, !didRender {
            let clearRect = Rect(topLeft:Point(x:0, y:0), size:canvasSize)
            let clearRectangle = Rectangle(rect:clearRect, fillMode:.clear)
            canvas.render(clearRectangle)
            switch (currentPattern) {
            case 1:
                renderPattern1(canvas:canvas)
            case 2:
                renderPattern2(canvas:canvas)
            case 3:
                renderPattern3(canvas:canvas)
            case 4:
                renderPattern4(canvas:canvas)
            case 5:
                renderPattern5(canvas:canvas)
            case 6:
                renderPattern6(canvas:canvas)
            case 7:
                renderPattern7(canvas:canvas)
            case 8:
                renderPattern8(canvas:canvas)
            case 9:
                renderPattern9(canvas:canvas)
            default:
                fatalError("Unexpected pattern: \(currentPattern)")
            }
            didRender = true
        }
    }
    override func setup(canvasSize:Size, canvas:Canvas) {
        dispatcher.registerEntityMouseClickHandler(handler:self)
        rect = Rect(size:canvasSize)
    }
    override func teardown() {
        dispatcher.unregisterEntityMouseClickHandler(handler:self)
    }
    override func boundingRect() -> Rect {
        if let rect = rect {
            return rect
        } else {
            return Rect()
        }
    }
}             
