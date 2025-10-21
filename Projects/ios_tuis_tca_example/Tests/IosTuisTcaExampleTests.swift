import ComposableArchitecture
import XCTest

@testable import ios_tuis_tca_example

@MainActor
final class CounterFeatureTests: XCTestCase {

    // MARK: - Increment Tests

    func testIncrement() async {
        let store = TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        }

        await store.send(.incrementButtonTapped) {
            $0.count = 1
        }

        await store.send(.incrementButtonTapped) {
            $0.count = 2
        }
    }

    // MARK: - Decrement Tests

    func testDecrement() async {
        let store = TestStore(initialState: CounterFeature.State(count: 5)) {
            CounterFeature()
        }

        await store.send(.decrementButtonTapped) {
            $0.count = 4
        }

        await store.send(.decrementButtonTapped) {
            $0.count = 3
        }
    }

    // MARK: - Mixed Operations Tests

    func testIncrementAndDecrement() async {
        let store = TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        }

        await store.send(.incrementButtonTapped) {
            $0.count = 1
        }

        await store.send(.incrementButtonTapped) {
            $0.count = 2
        }

        await store.send(.decrementButtonTapped) {
            $0.count = 1
        }

        await store.send(.decrementButtonTapped) {
            $0.count = 0
        }
    }

    // MARK: - Edge Cases

    func testDecrementBelowZero() async {
        let store = TestStore(initialState: CounterFeature.State(count: 0)) {
            CounterFeature()
        }

        await store.send(.decrementButtonTapped) {
            $0.count = -1
        }

        await store.send(.decrementButtonTapped) {
            $0.count = -2
        }
    }

    // MARK: - State Verification Tests

    func testInitialState() {
        let state = CounterFeature.State()
        XCTAssertEqual(state.count, 0, "Initial count should be 0")
    }

    func testCustomInitialState() {
        let state = CounterFeature.State(count: 10)
        XCTAssertEqual(state.count, 10, "Custom initial count should be preserved")
    }
}