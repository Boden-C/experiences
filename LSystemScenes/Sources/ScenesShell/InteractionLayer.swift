import Igis
import Scenes
import ScenesControls

  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer {

    init() {
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Interaction")

        // We insert our RenderableEntities in the constructor
        let increaseGenerationButton = Button(name: "IncreaseGenCount", labelString: "Increase Generation", topLeft: Point(x: 50, y: 50))
        increaseGenerationButton.clickHandler = onIncreaseGenerationButtonClickHandler
        insert(entity: increaseGenerationButton, at: .front)

        let decreaseGenerationButton = Button(name: "DecreasecreaseGenCount", labelString: "Decrease Generation", topLeft: Point(x: 50, y: 80))
        decreaseGenerationButton.clickHandler = onDecreaseGenerationButtonClickHandler
        insert(entity: decreaseGenerationButton, at: .front)

        let increaseStepCountButton = Button(name: "IncreaseStepCountBy5", labelString: "Increase Step", topLeft: Point(x: 250, y: 50))
        increaseStepCountButton.clickHandler = onIncreaseStepCountClickHandler
        insert(entity: increaseStepCountButton, at: .front)

        let decreaseStepCountButton = Button(name: "DecreasecreaseStepCountBy5", labelString: "Decrease Step", topLeft: Point(x: 250, y: 80))
        decreaseStepCountButton.clickHandler = onDecreaseStepCountClickHandler
        insert(entity: decreaseStepCountButton, at: .front)

        let cycleSystemsButton = Button(name: "cycleSystems", labelString: "NextLSystem", topLeft: Point(x: 50, y: 110))
        cycleSystemsButton.clickHandler = onCycleSystemsClickHandler
        insert(entity: cycleSystemsButton, at: .front)

        let cycleColorsButton = Button(name: "cycleColor", labelString: "NextColor", topLeft: Point(x: 50, y: 140))
        cycleColorsButton.clickHandler = onCycleColorClickHandler
        insert(entity: cycleColorsButton, at: .front)
    }

    func background() -> Background {
        guard let mainScene = scene as? MainScene else {
            fatalError("mainScene of type MainScene is required")
        }
        let backgroundLayer = mainScene.backgroundLayer
        let background = backgroundLayer.background
        return background
    }

    func onIncreaseGenerationButtonClickHandler(control: Control, localLocation: Point) {
        background().incrementGenerationCount()
    }

    func onDecreaseGenerationButtonClickHandler(control: Control, localLocation: Point) {
        background().decreaseGenerationCount()
    }

    func onIncreaseStepCountClickHandler(control: Control, localLocation: Point) {
        background().increaseStepCount()
    }
    func onDecreaseStepCountClickHandler(control: Control, lkocalLocation: Point) {
        background().decreaseStepCount()
    }

    func onCycleSystemsClickHandler(control: Control, localLocation: Point) {
        background().cycleLSystems()
    }

    func onCycleColorClickHandler(control: Control, localLocation: Point) {
        background().cycleColors()
    }

}
