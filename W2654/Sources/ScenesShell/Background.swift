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
                    metars.append(nonNil)
                }
            }
        } catch {
            print("Failed to load due to error \(error).")
        }

        func renderMetar(_ metar:Metar) {
            let center = metar.sky_cover1 ?? ""
            let topLeft = String(Int(metar.temp_c!))
            let topRight = String(Int(metar.altim_in_hg!))
            let middleLeft = String(Int(metar.visibility_statute_mi!))
            let middleRight = String(Int(metar.cloud_base_ft_agl1!))
            let bottomLeft = String(Int(metar.dewpoint_c!))
            let bottomRight = (metar.station_id) ?? ""
            let label = (metar.flight_category) ?? ""

            
            canvas.render(FillStyle(color:Color(.white)))
            canvas.render(Text(location:Point(x:0, y:-2), text: topLeft))

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
            canvas.render(Rectangle(rect:Rect(topLeft: Point(x: 86, y: 48), size:Size(width: 30, height: 15))))
            canvas.render(FillStyle(color:Color(red:7, green: 81, blue: 124)))
            canvas.render(Text(location: Point(x: 32, y: 58), text: bottomLeft))
            canvas.render(FillStyle(color:Color(.white)))
            canvas.render(Text(location: Point(x: 87, y:58), text: bottomRight))

            let angle = Double((metar.wind_dir_degrees) ?? 0)

            func roundToFive(_ num:Int) -> Int {
                return 5*Int(round(Float(num)/5))
            }
            
            let speed = roundToFive((metar.wind_speed_kt) ?? 0)
            let topSpeed = roundToFive((metar.wind_gust_kt) ?? 0)

            let spineSize = 2
            let half = spineSize / 2
            let barbGap = half / 3

            let halfBarb = 10
            let fullBarb = 20

            let turtle = Turtle(canvasSize:canvasSize)
            turtle.penUp()
            turtle.forward(steps:canvasSize.height/2-35)
            turtle.left(degrees:90)
            turtle.forward(steps:canvasSize.width/2-67)
            turtle.right(degrees:90)

            turtle.penColor(color: Color(.black))
            turtle.right(degrees:angle)
            turtle.penDown()
            turtle.forward(steps: half)
            turtle.push() //halfway pt barbs start
            turtle.forward(steps: half)
            turtle.pop()
            turtle.push()



            if speed == 5 {
                turtle.forward(steps: barbGap * 2)
                turtle.right(degrees: 90.0)
                turtle.forward(steps: halfBarb)
                turtle.pop()
            }

            if speed > 5 && speed <= 40 {

                var drawn = speed
                var barbGapMultiplier = 3


                while drawn > 0 {

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

                    barbGapMultiplier -= 1
                }
            }

            turtle.backward(steps: half) //reset turtle to start of barb
            canvas.render(turtle)
        }
        
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

        
        func convertToPixels(longitude: Double, latitude: Double,
                             topLeftLongitude: Double, topLeftLatitude: Double,
                             bottomRightLongitude: Double, bottomRightLatitude: Double,
                             topLeft:Point, size:Size) -> DoublePoint {

            // calculate the x and y distances of the given longitude and latitude from the top-left corner of the image
            let xDistanceFromTopLeft = (longitude - topLeftLongitude) / Double(size.width)
            let yDistanceFromTopLeft = (latitude - topLeftLatitude) / Double(size.height)

            // calculate the pixel coordinates by multiplying the distances by the image dimensions
            let pixelX = Double(topLeft.x) + xDistanceFromTopLeft * Double(size.width)
            let pixelY = Double(topLeft.y) + yDistanceFromTopLeft * Double(size.height)

            // create and return the resulting point
            return DoublePoint(x: pixelX, y: pixelY)
        }


        for metar in metars {
            let graphPoint = convertToPixels(longitude: metar.longitude!, latitude:metar.latitude!,
                                             topLeftLongitude: -125.0, topLeftLatitude: 53.0,
                                             bottomRightLongitude: -65.0, bottomRightLatitude: 25,
                                             topLeft:Point(x:0,y:0), size:scaledImageSize)
            let transform = Transform(translate:graphPoint)
            canvas.render(transform)
            renderMetar(metar)
        }

    }

}
