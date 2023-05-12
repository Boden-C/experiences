import Foundation
import Igis
import Scenes
  /*
     This class is responsible for rendering the background.
   */



class Background : RenderableEntity {

    let reference : Image
    let upScaled : Image
    let downScaled : Image
    let partial : Image

    init() {
        guard let referenceURL = URL(string:"https://pbs.twimg.com/media/DZDf6qZXcAANCnz.jpg") else {
            fatalError("Failed to create URL for reference")
        }
        reference = Image(sourceURL:referenceURL)

        guard let upScaledURL = URL(string:"https://pbs.twimg.com/media/D2nboTFWwAA2tD-.jpg") else {
            fatalError("Failed to create URL for upScaled")
        }
        upScaled = Image(sourceURL:upScaledURL)
        
        guard let downScaledURL = URL(string:"https://pbs.twimg.com/media/DYbxiPHX0AEf147.jpg") else {
            fatalError("Failed to create URL for downScaled")
        }
        downScaled = Image(sourceURL:downScaledURL)

        guard let partialURL = URL(string:"https://pbs.twimg.com/media/DYbxk-oXUAA9fiX.jpg") else {
            fatalError("Failed to create URL for reference")
        }
        partial = Image(sourceURL:partialURL)
        
        
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Background")
    }

    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(reference)
        canvas.setup(upScaled)
        canvas.setup(downScaled)
        canvas.setup(partial)
    }
    
    override func render(canvas:Canvas) {
        if reference.isReady {
            let destinationRect = Rect(topLeft:Point(x:50,y:50), size:Size(width:720, height:405))
            reference.renderMode = .destinationRect(destinationRect)
            let frame = Rectangle(rect:destinationRect, fillMode:.stroke)
            let strokeStyle = StrokeStyle(color:Color(.green))
            let text = Text(location:Point(x:destinationRect.topLeft.x, y:destinationRect.topLeft.y-10), text:"Reference")
            text.font = "20pt Arial"
            canvas.render(reference, strokeStyle, frame, text)
        }

        if upScaled.isReady {
            let destinationRect = Rect(topLeft:Point(x:800, y:50), size:Size(width:1024, height:576))
            upScaled.renderMode = .destinationRect(destinationRect)
            let frame = Rectangle(rect:destinationRect, fillMode:.stroke)
            let strokeStyle = StrokeStyle(color:Color(.red))
            let text = Text(location:Point(x:destinationRect.topLeft.x, y:destinationRect.topLeft.y-10), text:"Up Scaled")
            text.font = "20pt Arial"
            canvas.render(upScaled, strokeStyle, frame, text)
        }

        if downScaled.isReady {
            let destinationRect = Rect(topLeft:Point(x:50, y:500), size:Size(width:480, height:270))
            downScaled.renderMode = .destinationRect(destinationRect)
            let frame = Rectangle(rect:destinationRect, fillMode:.stroke)
            let strokeStyle = StrokeStyle(color:Color(.blue)) 
            let text = Text(location:Point(x:destinationRect.topLeft.x, y:destinationRect.topLeft.y-10), text:"Down Scaled")
            text.font = "20pt Arial"
            canvas.render(downScaled, strokeStyle, frame, text)
        }

        if partial.isReady {
            let sourceRect = Rect(topLeft:Point(x:0, y:0), size:Size(width:500, height:500))
            let destinationRect = Rect(topLeft:Point(x:800, y:680), size:Size(width:250, height:250))
            partial.renderMode = .sourceAndDestination(sourceRect:sourceRect, destinationRect:destinationRect)
            let frame = Rectangle(rect:destinationRect, fillMode:.stroke)
            let strokeStyle = StrokeStyle(color:Color(.gold)) 
            let text = Text(location:Point(x:destinationRect.topLeft.x, y:destinationRect.topLeft.y-10), text:"Partial")
            text.font = "20pt Arial"
            canvas.render(partial, strokeStyle, frame, text)
        }
            
        
    }
}
