/*
import Foundation
import Scenes
import Igis

/*
 This class is responsible for the background Layer.
 Internally, it maintains the RenderableEntities for this layer.
 */

class BackgroundLayer : Layer {
    let background = Background()
    let backgroundMap: Image

    init() {
        guard let mapURL = URL(string:"https://upload.wikimedia.org/wikipedia/commons/d/d8/MapOfTheUS.png") else {
            fatalError("Failed to create URL for whitehouse")
        }
        self.backgroundMap = Image(sourceURL:mapURL)
        self.canvasSize = Size(width:0, height:0)
        
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Background")

        // We insert our RenderableEntities in the constructor
        insert(entity:background, at:.back)
    }

    override func setup(canvasSize:Size, canvas:Canvas) {
        self.canvasSize = canvasSize
    }

    override func render(canvas:Canvas) {
        //Background image code
        let imageOriginalSize = Size(width: 1333, height: 522)
        var scaledImageSize = Size(width: imageOriginalSize.width, height: imageOriginalSize.height)

        // Scale the image up until it reaches the canvas width or height, whichever comes first
        if scaledImageSize.width > canvasSize.width {
            let scaleFactor = Double(canvasSize.width) / Double(scaledImageSize.width)
            scaledImageSize.width = canvasSize.width
            scaledImageSize.height = Int(Double(scaledImageSize.height) * scaleFactor)
        }

        if scaledImageSize.height > canvasSize.height {
            let scaleFactor = Double(canvasSize.height) / Double(scaledImageSize.height)
            scaledImageSize.height = canvasSize.height
            scaledImageSize.width = Int(Double(scaledImageSize.width) * scaleFactor)
        }

        if backgroundMap.isReady {
            backgroundMap.renderMode = .destinationRect(Rect(topLeft:Point(x:0, y:0), size:scaledImageSize))
            canvas.render(whitehouse)
        }
    }
}
