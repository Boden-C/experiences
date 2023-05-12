class Group {
    let origin: Point
    var items: [GroupObject]

    init(origin:Point?=Point(0,0)) {
        self.origin = origin
        self.items = []
    }

    func addRectangle(topLeft:Point=Point(0,0), height:Int=100, width:Int=100, rotationRadians:Int=0, 
                      fillColor:Color?=Color(128, 128, 128), strokeColor:Color?=nil, 
                      text:String?=nil, textColor:Color?=Color(0, 0, 0)) {
    }
    func addRectangle(top:Point=Point(0,0), height:Int=100, width:Int=100, rotationRadians:Int=0, 
                      fillColor:Color?=Color(128, 128, 128), strokeColor:Color?=nil, 
                      text:String?=nil, textColor:Color?=Color(0, 0, 0)) {
    }
    func addRectangle(left:Point=Point(0,0), height:Int=100, width:Int=100, rotationRadians:Int=0, 
                      fillColor:Color?=Color(128, 128, 128), strokeColor:Color?=nil, 
                      text:String?=nil, textColor:Color?=Color(0, 0, 0)) {
    }
    func addRectangle(right:Point=Point(0,0), height:Int=100, width:Int=100, rotationRadians:Int=0, 
                      fillColor:Color?=Color(128, 128, 128), strokeColor:Color?=nil, 
                      text:String?=nil, textColor:Color?=Color(0, 0, 0)) {
    }
    func addRectangle(bottom:Point=Point(0,0), height:Int=100, width:Int=100, rotationRadians:Int=0, 
                      fillColor:Color?=Color(128, 128, 128), strokeColor:Color?=nil, 
                      text:String?=nil, textColor:Color?=Color(0, 0, 0)) {
    }

    func addCircle(center:Point=Point(0,0), radius:Int=100,
                   fillColor:Color?=Color(128, 128, 128), strokeColor:Color?=nil, 
                   ) {
    }

    func addEllipse(center:Point=Point(0,0), radiusX:Int=100, radiusY:Int=100, rotationRadians:Int=0, 
                    fillColor:Color?=Color(128, 128, 128), strokeColor:Color?=nil, 
                    ) {
    }

    func addLine(start:Point=Point(0,0), end:Point=Point(0,0), 
                 strokeColor:Color?=Color(128, 128, 128), strokeWidth:Int=10) {
    }

    func addText(top:Point=Point(0,0), text:String, textColor:Color?=Color(0, 0, 0)) {
    }
    func addText(left:Point=Point(0,0), text:String, textColor:Color?=Color(0, 0, 0)) {
    }
    func addText(right:Point=Point(0,0), text:String, textColor:Color?=Color(0, 0, 0)) {
    }
    func addText(bottom:Point=Point(0,0), text:String, textColor:Color?=Color(0, 0, 0)) {
    }

    func addImage(topLeft:Point=Point(0,0), rotationRadians:Int=0) {
    }
    func addImage(top:Point=Point(0,0), rotationRadians:Int=0) {
    }
    func addImage(left:Point=Point(0,0), rotationRadians:Int=0) {
    }
    func addImage(right:Point=Point(0,0), rotationRadians:Int=0) {
    }
    func addImage(bottom:Point=Point(0,0), rotationRadians:Int=0) {
    }

    func addDiv()

    func render(at:Point=self.origin) {

    }
}

struct GroupObject {
    let rotationRadians:Int
    let object:object
}

let t = Group(origin:.center)
t.addImage(top:Point(1,2), rotationRadians:5)