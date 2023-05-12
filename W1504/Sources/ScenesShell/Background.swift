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

      func renderEye(location:Point, canvas:Canvas) {
          var loc = location
          loc.x += 85
          loc.y += 75
          let outerPath = Path(fillMode:.fillAndStroke)
          outerPath.arc(center:loc, radius:100, startAngle:1.2*Double.pi, endAngle:1.8*Double.pi)
          loc.y -= 117
          outerPath.arc(center:loc, radius:100, startAngle:0.2*Double.pi, endAngle:0.8*Double.pi)
          let outerFillStyle = FillStyle(color:Color(.aliceblue))
          let outerLineWidth = LineWidth(width:2)
          canvas.render(outerFillStyle, outerLineWidth, outerPath)
  
          let innerPath = Path(fillMode:.fillAndStroke)
          loc.y += 55
          innerPath.arc(center:loc, radius:30)
          let innerFillStyle = FillStyle(color:Color(.skyblue))
          let innerStrokeStyle = StrokeStyle(color:Color(.skyblue))
          canvas.render(innerFillStyle, innerStrokeStyle, innerPath)

          let pupil = Ellipse(center:loc, radiusX:15, radiusY:15, fillMode:.fill)
          let pupilFillStyle = FillStyle(color:Color(.black))
          canvas.render(pupilFillStyle, pupil)

          loc.x -= 5
          loc.y -= 7
          let white = Ellipse(center:loc, radiusX:5, radiusY:5, fillMode:.fill)
          let whiteFillStyle = FillStyle(color:Color(.white))
          canvas.render(whiteFillStyle, white)

          let lashes = Path()
          var lines = location
          var moves = location
          moves.x += 0
          moves.y += 0
          lashes.moveTo(moves)
          lines.x -= 20
          lines.y -= 20
          lashes.lineTo(lines)
          moves.x += 20
          moves.y -= 15
          lashes.moveTo(moves)
          lines.x += 25
          lines.y -= 15
          lashes.lineTo(lines)
          moves.x += 30
          moves.y -= 15
          lashes.moveTo(moves)
          lines.x += 35
          lines.y -= 15
          lashes.lineTo(lines)
          moves.x += 35
          moves.y -= 5
          lashes.moveTo(moves)
          lines.x += 45
          lines.y -= 5
          lashes.lineTo(lines)
          moves.x += 35
          moves.y += 5
          lashes.moveTo(moves)
          lines.x += 45
          lines.y += 5
          lashes.lineTo(lines)
          moves.x += 25
          moves.y += 10
          lashes.moveTo(moves)
          lines.x += 30
          lines.y += 10
          lashes.lineTo(lines)
          moves.x += 20
          moves.y += 20
          lashes.moveTo(moves)
          lines.x += 25
          lines.y += 20
          lashes.lineTo(lines)
          let lashesStrokeStyle = StrokeStyle(color:Color(.black))
          let lashesLineWidth = LineWidth(width:3)
          canvas.render(lashesStrokeStyle, lashesLineWidth, lashes)
      }

      override func setup(canvasSize:Size, canvas:Canvas) {
          renderEye(location:Point(x:1000, y:500), canvas:canvas)
          renderEye(location:Point(x:1300, y:500), canvas:canvas)
      }

}
