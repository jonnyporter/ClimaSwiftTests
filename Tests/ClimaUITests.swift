import XCTest
import Clima

class ClimaUITests: XCTestCase {

    func testCitySearch() throws {
        let app = XCUIApplication()
        let mainScreen = MainScreen(app: app)
        // Launch App
        mainScreen.app.launch()
        // Search city in search field and tap search button
        mainScreen.searchCity(mainScreen.location1)
        // Assert city was found
        XCTAssertEqual(mainScreen.location1, mainScreen.cityName.label)
        // Search different city in search field and tap search button
        mainScreen.searchCity(mainScreen.location2)
        // Assert different city was found
        XCTAssertEqual(mainScreen.location2, mainScreen.cityName.label)
    }
    
    func testCityGPSLocationButton() throws {
        let app = XCUIApplication()
        let mainScreen = MainScreen(app: app)
        // Launch App
        mainScreen.app.launch()
        // Doing this resets the city name label
        mainScreen.searchCity(mainScreen.location1)
        // Asserting the city name label was changed
        XCTAssertEqual(mainScreen.location1, mainScreen.cityName.label)
        // Testing GPS button finds city location
        mainScreen.gpsButton.tap()
        // Assert GPS city location was found
        XCTAssertEqual(mainScreen.location3, mainScreen.cityName.label)
    }
    
    func testUnitChangesWhenTapped() throws {
        let app = XCUIApplication()
        let mainScreen = MainScreen(app: app)
        // Launch App
        mainScreen.app.launch()
        // This will reset the temperature unit value back to Fahrenheit since the API is imperial
        mainScreen.searchCity(mainScreen.location1)
        // Assert that temperature unit label is in Fahrenheit
        XCTAssertEqual(mainScreen.tempF, mainScreen.tempUnit.label)
        mainScreen.tempUnit.tap()
        // Assert the temperature unit label has changed to Celsius when tapped
        XCTAssertEqual(mainScreen.tempC, mainScreen.tempUnit.label)
    }
}
