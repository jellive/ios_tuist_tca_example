import XCTest

final class CounterUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    // MARK: - Helper Properties

    private var counterLabel: XCUIElement {
        app.staticTexts["counterLabel"]
    }

    private var incrementButton: XCUIElement {
        app.buttons["incrementButton"]
    }

    private var decrementButton: XCUIElement {
        app.buttons["decrementButton"]
    }

    // MARK: - Initial State Tests

    func testInitialCounterValue() throws {
        // Given: App is launched
        // When: Checking the initial counter value
        // Then: Counter should display 0
        XCTAssertTrue(counterLabel.exists, "Counter label should exist")
        XCTAssertEqual(counterLabel.label, "0", "Counter should initially display 0")
    }

    // MARK: - Increment Tests

    func testIncrementButton() throws {
        // Given: Counter starts at 0
        XCTAssertTrue(incrementButton.exists, "Increment button should exist")

        // When: Tapping increment button
        incrementButton.tap()

        // Then: Counter should be 1
        XCTAssertEqual(counterLabel.label, "1", "Counter should display 1 after increment")
    }

    func testMultipleIncrements() throws {
        // Given: Counter starts at 0
        // When: Tapping increment button 5 times
        for _ in 1...5 {
            incrementButton.tap()
        }

        // Then: Counter should be 5
        XCTAssertEqual(counterLabel.label, "5", "Counter should display 5 after 5 increments")
    }

    // MARK: - Decrement Tests

    func testDecrementButton() throws {
        // Given: Counter starts at 0
        XCTAssertTrue(decrementButton.exists, "Decrement button should exist")

        // When: Tapping decrement button
        decrementButton.tap()

        // Then: Counter should be -1
        XCTAssertEqual(counterLabel.label, "-1", "Counter should display -1 after decrement")
    }

    func testMultipleDecrements() throws {
        // Given: Counter starts at 0
        // When: Tapping decrement button 3 times
        for _ in 1...3 {
            decrementButton.tap()
        }

        // Then: Counter should be -3
        XCTAssertEqual(counterLabel.label, "-3", "Counter should display -3 after 3 decrements")
    }

    // MARK: - Mixed Operations Tests

    func testIncrementAndDecrementCombination() throws {
        // Given: Counter starts at 0
        // When: Performing mixed operations
        incrementButton.tap()
        incrementButton.tap()
        incrementButton.tap()  // Counter: 3

        decrementButton.tap()   // Counter: 2

        incrementButton.tap()   // Counter: 3
        incrementButton.tap()   // Counter: 4

        decrementButton.tap()   // Counter: 3
        decrementButton.tap()   // Counter: 2
        decrementButton.tap()   // Counter: 1

        // Then: Counter should be 1
        XCTAssertEqual(counterLabel.label, "1", "Counter should display 1 after mixed operations")
    }

    func testReturnToZero() throws {
        // Given: Counter starts at 0
        // When: Incrementing then decrementing back to 0
        for _ in 1...10 {
            incrementButton.tap()
        }

        for _ in 1...10 {
            decrementButton.tap()
        }

        // Then: Counter should be back to 0
        XCTAssertEqual(counterLabel.label, "0", "Counter should return to 0")
    }

    // MARK: - UI Element Existence Tests

    func testAllUIElementsExist() throws {
        // Given: App is launched
        // When: Checking for UI elements
        // Then: All elements should exist
        XCTAssertTrue(incrementButton.exists, "Increment button should exist")
        XCTAssertTrue(decrementButton.exists, "Decrement button should exist")
        XCTAssertTrue(counterLabel.exists, "Counter label should exist")
    }

    // MARK: - Performance Tests

    func testRapidTapping() throws {
        // Given: Counter starts at 0
        // When: Rapidly tapping increment button
        measure {
            for _ in 1...20 {
                incrementButton.tap()
            }
        }

        // Then: Test completes without crashes
        XCTAssertTrue(app.exists, "App should remain responsive")
    }
}
