import Scenes
import Igis
import Foundation

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {
    let metars: [Metar]
    let backgroundImage:Image
    var canvasSize = Size(width:0, height:0)

    init() {
        var tempMetars = [Metar]()

        let filePath = "./Example-metars.csv"
        let fileURL = URL(fileURLWithPath:filePath.expandingTildeInPath)
        do {
            let contents = try String(contentsOf: fileURL)
            for (i,line) in contents.components(separatedBy:"\n").enumerated() {
                if (i < 6) {
                    continue;
                }
                let metar = Metar(string:line)
                if let nonNil = metar {
                    if (
                          nonNil.latitude == nil ||
                          nonNil.longitude == nil ||
                          nonNil.temp_c == nil ||
                          nonNil.altim_in_hg == nil ||
                          nonNil.visibility_statute_mi == nil ||
                          nonNil.cloud_base_ft_agl1 == nil ||
                          nonNil.dewpoint_c == nil) {
                        continue;
                    }
                    tempMetars.append(nonNil)
                }
            }
        } catch {
            print("Failed to load due to error \(error).")
        }
        self.metars = tempMetars
        self.backgroundImage = Image(sourceURL:URL(string:"https://upload.wikimedia.org/wikipedia/commons/d/d8/MapOfTheUS.png")!)
        
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Background")
    }

    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(self.backgroundImage)
        self.canvasSize = canvasSize
    }

    override func render(canvas:Canvas) {

        if backgroundImage.isReady {
            backgroundImage.renderMode = .destinationRect(Rect(topLeft:Point(x:50, y:0), size:Size(width:Int(1333*((canvasSize.height)/522)), height:canvasSize.height)))
            canvas.render(backgroundImage)
        }

        func roundToFive(_ num:Int) -> Int {
            return 5*Int(round(Float(num)/5))
        }


        func drawWindBarb(turtle: Turtle, color: Color, speed: Int, angle: Int)  {

            let angle = Double(angle)
            let speed = roundToFive(speed)

            let spineSize = 50
            let half = spineSize / 2
            let barbGap = half / 3

            let halfBarb = 10
            let fullBarb = 20

            turtle.penColor(color: color)
            turtle.right(degrees:angle)
            turtle.penDown()
            turtle.forward(steps: half)
            turtle.push() //halfway pt barbs start
            turtle.forward(steps: half)
            turtle.pop()
            turtle.push()

            if speed == 5 { //why are you special
                turtle.forward(steps: barbGap * 2)
                turtle.right(degrees: 90.0)
                turtle.forward(steps: halfBarb)
                turtle.pop()
            }

            if speed > 5 && speed <= 40 {

                var drawn = speed
                var barbGapMultiplier = 3


                while drawn > 0 {

                    //print(drawn)

                    turtle.forward(steps: barbGap * barbGapMultiplier)
                    turtle.right(degrees: 90)

                    if drawn >= 10 {
                        turtle.forward(steps: fullBarb)
                        drawn -= 10
                        turtle.pop()
                        turtle.push()
                    }
                    else if drawn == 5 {
                        turtle.forward(steps: halfBarb)
                        drawn -= 5
                        turtle.pop()
                    }
                    else { print("error") }

                    barbGapMultiplier -= 1
                }
            }
            turtle.penUp()
            turtle.home() //reset turtle
        }

        func drawBarbMax(turtle: Turtle, metar: Metar) {
            let speed = metar.wind_speed_kt ?? 0
            let angle = metar.wind_dir_degrees ?? 0

            turtle.penUp()
            turtle.forward(steps:canvasSize.height/2-35)
            turtle.left(degrees:90)
            turtle.forward(steps:canvasSize.width/2-67)
            turtle.right(degrees:90)
            turtle.penDown()

            if metar.wind_gust_kt != nil && metar.wind_gust_kt ?? 0 > metar.wind_speed_kt ?? 0{
                let topSpeed = metar.wind_gust_kt ?? 0

                drawWindBarb(turtle: turtle, color: Color(.red), speed: topSpeed, angle: angle)
                drawWindBarb(turtle: turtle, color: Color(.black), speed: speed, angle: angle)
            } else {
                drawWindBarb(turtle: turtle, color: Color(.black), speed: speed, angle: angle)
            }
        }


        func renderMetar(_ metar:Metar, point:DoublePoint) {
            
            let center = metar.sky_cover1 ?? ""
            let topLeft = String(Int(metar.temp_c!))
            let topRight = String(Int(metar.altim_in_hg!))
            let middleLeft = String(Int(metar.visibility_statute_mi!))
            let middleRight = String(Int(metar.cloud_base_ft_agl1!))
            let bottomLeft = String(Int(metar.dewpoint_c!))
            let bottomRight = (metar.station_id) ?? ""
            let label = (metar.flight_category) ?? ""

            var color:Color
            switch label {
            case "VFR":
                color = Color(red: 44, green: 128, blue: 38)
            case "MVFR":
                color = Color(red: 0, green: 49, blue: 245)
            case "IFR":
                color = Color(red: 245, green: 0, blue: 0)
            case "LIFR":
                color = Color(red: 241, green: 10, blue: 245)
            default:
                color = Color(red: 0, green: 0, blue: 0) // Default color if none of the cases match
            }
            let centerCircleStrokeStyle = StrokeStyle(color:color)
            var centerCircleFillStyle = FillStyle(color:Color(.white))
            if (center == "OVC") {
                centerCircleFillStyle = FillStyle(color:color)
            }   
            let centerCircle = Ellipse(center:Point(x:67, y:35), radiusX:21, radiusY:21, fillMode:.fillAndStroke)
            canvas.render(centerCircleStrokeStyle)
            canvas.render(centerCircleFillStyle)
            canvas.render(centerCircle)

            let blackFillStyle = FillStyle(color: Color(.black))
            canvas.render(blackFillStyle)

            canvas.render(Text(location:Point(x: 32, y: 17), text:topLeft))
            canvas.render(Text(location: Point(x: 92, y: 17), text:topRight))
            canvas.render(Text(location: Point(x: 21, y: 38), text: middleLeft))
            canvas.render(Text(location: Point(x: 97, y: 38), text: middleRight))
            canvas.render(FillStyle(color:Color(red:7, green: 81, blue: 124)))
            canvas.render(Text(location: Point(x: 32, y: 58), text: bottomLeft))
            canvas.render(Text(location: Point(x: 87, y:58), text: bottomRight))
            
            let turtle = Turtle(canvasSize:canvasSize)
            drawBarbMax(turtle:turtle, metar:metar)
            canvas.render(turtle)
        }

        //Background image code
        
        func convertToPixels(longitude: Double, latitude: Double,
                             topLeftLongitude: Double, topLeftLatitude: Double,
                             bottomRightLongitude: Double, bottomRightLatitude: Double
        ) -> DoublePoint {

            // calculate the total width and height of the image in pixels
            let widthInPixels = Double(1333*((canvasSize.height-50)/522))
            let heightInPixels = Double(canvasSize.height-50)
            
            let xDistanceFromTopLeft = (longitude - topLeftLongitude) / (bottomRightLongitude - topLeftLongitude) * widthInPixels
            let yDistanceFromTopLeft = (latitude - topLeftLatitude) / (bottomRightLatitude - topLeftLatitude) * heightInPixels

            let pixelX = xDistanceFromTopLeft
            let pixelY = yDistanceFromTopLeft

            // create and return the resulting point
            return DoublePoint(x: Double(pixelX), y: Double(pixelY))
        }
        
        for (i, metar) in self.metars.enumerated() {
            let graphPoint = convertToPixels(longitude: metar.longitude!, latitude:metar.latitude!,
                                             topLeftLongitude: -125.0, topLeftLatitude: 50.0,
                                             bottomRightLongitude: -65.0, bottomRightLatitude: 25)
            canvas.render(Transform(translate:graphPoint))
            renderMetar(metar, point:graphPoint)
            canvas.render(Transform(translate:-graphPoint))
        }
    }
}
