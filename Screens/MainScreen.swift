import Foundation
import XCTest

class MainScreen {
    
    let app: XCUIApplication
    let gpsButton: XCUIElement
    let searchButton: XCUIElement
    let searchField: XCUIElement
    let cityName: XCUIElement
    let tempUnit: XCUIElement
    let tempDegree: XCUIElement
    
    let location1 = "Boise"
    let location2 = "London"
    let location3 = "Cupertino"
    
    let tempC = "C"
    let tempF = "F"
    
    func searchCity(_ cityName: String) {
        searchField.tap()
        searchField.typeText(cityName)
        searchButton.tap()
    }
        
    init(app: XCUIApplication) {
        self.app = app
        gpsButton = app.buttons["location.circle"]
        searchButton = app.buttons["magnifyingglass"]
        searchField = app.textFields["searchField"]
        cityName = app.staticTexts["cityName"]
        tempUnit = app.buttons["tempUnit"]
        tempDegree = app.staticTexts["tempDegree"]
        
    }
}
