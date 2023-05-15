import Scenes
import Igis

class Ball : RenderableEntity, MouseMoveHandler {
    let ellipse = Ellipse(center:Point(x:0, y:0), radiusX:30, radiusY:30, fillMode:.fillAndStroke)
    let strokeStyle = StrokeStyle(color:Color(.orange))
    let fillStyle = FillStyle(color:Color(.red))
    let lineWidth = LineWidth(width:5)

    private var originalRadius : Int
    
    private var velocityX = 0
    private var velocityY = 0

    private var originalVelocityX = 0
    private var originalVelocityY = 0

    func changeVelocity(velocityX:Int, velocityY:Int) {
        self.velocityX = velocityX
        self.velocityY = velocityY

        originalVelocityX = velocityX
        originalVelocityY = velocityY
    }
    
    init() {
        // Using a meaningful name can be helpful for debugging

        originalRadius = ellipse.radiusX
       
        super.init(name:"Ball")
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
        let doorRect = Rect(topLeft:Point(x:(rect.topLeft.x)+(rect.size.width)-50,y:(rect.topLeft.y)+(rect.size.height)-50), size:Size(width:25, height:50))
        var windowRect = Rect(topLeft:Point(x:(rect.topLeft.x)+10,y:doorRect.topLeft.y), size:Size(width:80, height:17))
        for _ in 1..<(rect.size.height)/40 {
            renderColorRectangle(canvas:canvas, rect:windowRect, color:Color(.white))
            windowRect.topLeft.y -= 40
        }
    }

    func renderBackground(canvas:Canvas) {
        let skyRect = Rect(topLeft:Point(x:0, y:0), size:Size(width:9000, height:650))
        renderColorRectangle(canvas:canvas, rect:skyRect, color:Color(.skyblue))

        let skyscraperRect = Rect(topLeft:Point(x:500, y:350), size:Size(width:150, height:300))
        skyscraper(canvas: canvas, rect:skyscraperRect, color:Color(.gray))

        let grassRect = Rect(topLeft:Point(x:0, y:650), size:Size(width:9000, height:9000))
        renderColorRectangle(canvas:canvas, rect:grassRect, color:Color(.green))

        let woodPoleRect = Rect(topLeft:Point(x:100, y:500), size:Size(width:20, height:400))
        renderColorRectangle(canvas:canvas, rect:woodPoleRect, color:Color(.brown))
        let woodBarRect = Rect(topLeft:Point(x:40, y:550), size:Size(width:140, height:10))
        renderColorRectangle(canvas:canvas, rect:woodBarRect, color:Color(.brown))
        var transformerRect = Rect(topLeft:Point(x:80, y:570), size:Size(width:20, height:40))
        renderColorRectangle(canvas:canvas, rect:transformerRect, color:Color(.gray))
        transformerRect.topLeft.x += 40
        renderColorRectangle(canvas:canvas, rect:transformerRect, color:Color(.gray))

        var trashCanRect = Rect(topLeft:Point(x:150, y:850), size:Size(width:40, height:80))
        renderColorRectangle(canvas:canvas, rect:trashCanRect, color:Color(.gray))
        trashCanRect.topLeft.x -= 10
        trashCanRect.topLeft.y -= 10
        trashCanRect.size.width = 60
        trashCanRect.size.height = 10
        renderColorRectangle(canvas:canvas, rect:trashCanRect, color:Color(.gray))

        let factoryRect = Rect(topLeft:Point(x:1000, y:530), size:Size(width:300, height:120))
        skyscraper(canvas:canvas, rect:factoryRect, color:Color(.darkslategray))
        var smokeStakeRect = Rect(topLeft:Point(x:1125, y:480), size:Size(width:50, height:170))
        renderColorRectangle(canvas:canvas, rect:smokeStakeRect, color:Color(.gray))
        smokeStakeRect.topLeft.x += 100
        renderColorRectangle(canvas:canvas, rect:smokeStakeRect, color:Color(.gray))
    }                                                                        

    public func horizontalBounce() {
        velocityX *= -10
        ellipse.radiusX = 10
    }
    
    public func verticalBounce() {
        velocityY *= -10
        ellipse.radiusX = 10
    }
    
    override func calculate(canvasSize:Size) {

        if ellipse.radiusX < originalRadius {
            ellipse.radiusX += 1
        }
        if ellipse.radiusY < originalRadius {
            ellipse.radiusY += 1
        }
        if velocityX.magnitude > originalVelocityX.magnitude {
            velocityX -= velocityX.signum()
        }
        if velocityY.magnitude > originalVelocityY.magnitude {
            velocityY -= velocityY.signum()
        }
        
        // First, move to the new position
        ellipse.center += Point(x:velocityX, y:velocityY)

        // Form a bounding rectangle around the canvas
        let canvasBoundingRect = Rect(size:canvasSize)

        // Form a bounding rect around the ball (ellipse)
        let ballBoundingRect = Rect(topLeft:Point(x:ellipse.center.x-ellipse.radiusX, y:ellipse.center.y-ellipse.radiusY),
                                    size:Size(width:ellipse.radiusX*2, height:ellipse.radiusY*2))

        // Determine if we've moved outside of the canvas boundary rect
        let tooFarLeft = ballBoundingRect.topLeft.x < canvasBoundingRect.topLeft.x
        let tooFarRight = ballBoundingRect.topLeft.x + ballBoundingRect.size.width > canvasBoundingRect.topLeft.x + canvasBoundingRect.size.width

        let tooFarUp = ballBoundingRect.topLeft.y < canvasBoundingRect.topLeft.y
        let tooFarDown = ballBoundingRect.topLeft.y + ballBoundingRect.size.height > canvasBoundingRect.topLeft.y + canvasBoundingRect.size.height
        
        // If we're too far to the left or right, we bounce the x velocity
        if tooFarLeft || tooFarRight {
            horizontalBounce()
        } 
        // If we're too far to the top or bottom, we bound the y velocity
        if tooFarUp || tooFarDown {
            verticalBounce()
        }
    }
    
    
    override func setup(canvasSize: Size, canvas: Canvas) {
        // Position the ellipse at the center of the canvas
        ellipse.center = canvasSize.center
        dispatcher.registerMouseMoveHandler(handler:self)
    }
    
    override func render(canvas:Canvas) {
        renderBackground(canvas:canvas)
        canvas.render(strokeStyle, fillStyle, lineWidth, ellipse)
    }

    override func teardown() {
        dispatcher.unregisterMouseMoveHandler(handler:self)
    }

    func onMouseMove(globalLocation: Point, movement: Point) {
        ellipse.center = globalLocation
    }

    override func boundingRect() -> Rect {
        return Rect(size: Size(width: Int.max, height: Int.max))
    }
}
