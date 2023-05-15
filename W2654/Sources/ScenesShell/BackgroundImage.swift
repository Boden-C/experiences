import Scenes
import Igis

class BackgroundImage : RenderableEntity {
    let imageURL = "https://upload.wikimedia.org/wikipedia/commons/d/d8/MapOfTheUS.pnghttps://upload.wikimedia.org/wikipedia/commons/d/d8/MapOfTheUS.png"
    var image : Image?
    var canvasSize = Size(width:0, height:0)

    override func calculate(canvasSize: Size) {
        ImageLoader.load(imageURL) { loadedImage in
            self.image = loadedImage
        }

        self.canvasSize = canvasSize
    }

    override func render(canvas: Canvas) {
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
