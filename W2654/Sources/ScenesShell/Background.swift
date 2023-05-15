import Scenes
import Igis
import Foundation

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {


    init() {      
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Background")
    }

    override func setup(canvasSize:Size, canvas:Canvas) {

        var metars = [Metar]()

        let filePath = "./Example-metars.csv"
        let fileURL = URL(fileURLWithPath:filePath.expandingTildeInPath)
        do {
            let contents = try String(contentsOf: fileURL)
            for (i,line) in contents.components(separatedBy:"\n").enumerated() {
                if (i < 7) {
                    continue;
                }
                let metar = Metar(string:line)
                if let nonNil = metar {
                    metars.append(nonNil)
                }
            }
        } catch {
            print("Failed to load due to error \(error).")
        }

        let text = Text(location:Point(x:100,y:100), text:(metars[0].raw_text)!)
        canvas.render(text)
        

        
        let lineWidth = LineWidth(width:3)
        canvas.render(lineWidth)

        let blue = StrokeStyle(color:Color(red:100, green:100, blue:255))
        canvas.render(blue)

        let lines = Lines(from:Point(x:110, y:150), to:Point(x:200, y:150))
        lines.lineTo(Point(x:155, y:250))
        lines.lineTo(Point(x:110, y:150))
        canvas.render(lines)
    }
}
