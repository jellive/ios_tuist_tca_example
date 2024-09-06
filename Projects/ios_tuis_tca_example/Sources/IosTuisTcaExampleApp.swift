import SwiftUI
import ComposableArchitecture

@main
struct IosTuisTcaExampleApp: App {
    static let store = Store(initialState: CounterFeature.State()) {
        CounterFeature()._printChanges()
    }
    
    var body: some Scene {
        WindowGroup {
            CounterView(store: IosTuisTcaExampleApp.store)
        }
    }
}
