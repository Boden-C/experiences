import Igis
import Scenes

  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer, KeyDownHandler {
    
    let ball = Ball()
    let paddleLeft = Paddle(rect:Rect(size:Size(width:10, height:100)))
    let paddleRight = Paddle(rect:Rect(size:Size(width:10, height:100)))

    override func preSetup(canvasSize: Size, canvas:Canvas) {
        let paddleMargin = 120
        paddleLeft.move(to:Point(x:paddleMargin, y:canvasSize.center.y))
        paddleRight.move(to:Point(x:canvasSize.width - paddleMargin, y:canvasSize.center.y))

        dispatcher.registerKeyDownHandler(handler: self)
    }

    func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
        switch code {
        case "KeyS":
            paddleLeft.moveDown()
        case "KeyW":
            paddleLeft.moveUp()
        case "ArrowDown":
            paddleRight.moveDown()
        case "ArrowUp":
            paddleRight.moveUp()
        default:
            print("Invalid key: \(code)")
        }
    }
    
    override func preCalculate(canvas: Canvas) {
        let ballBoundingRect = ball.boundingRect()

        //Collision between Ball and Left Paddle
        let leftPaddleBoundingRect = paddleLeft.boundingRect()
        let leftPaddleContainment = leftPaddleBoundingRect.containment(target: ballBoundingRect)
        let leftPaddleImpactSet: ContainmentSet = [.contact, .overlapsRight]
        if leftPaddleImpactSet.isSubset(of: leftPaddleContainment) {
            ball.horizontalBounce()
        }

        //Collision between Ball and Right Paddle 
        let rightPaddleBoundingRect = paddleRight.boundingRect()
        let rightPaddleContainment = rightPaddleBoundingRect.containment(target: ballBoundingRect)
        if rightPaddleContainment.contains(.contact) && rightPaddleContainment.contains(.overlapsLeft) {
            ball.horizontalBounce()
        }
    }

    init() {
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Interaction")

        // We insert our RenderableEntities in the constructor
        insert(entity: ball, at: .front)
        ball.changeVelocity(velocityX: 8, velocityY: 10)

        insert(entity: paddleLeft, at: .front)
        insert(entity: paddleRight, at: .front)
    }

    override func postTeardown() {
        dispatcher.unregisterKeyDownHandler(handler: self)
    }
}
