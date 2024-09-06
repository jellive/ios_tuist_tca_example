import SwiftUI
import TuistUI // Tuist에서 만든 내부 의존성. 마음대로 만들어도 됨.
import ComposableArchitecture
import Combine


public struct CounterView: View {

    
    // store: Feature(Reducer Protocol을 준수하는)의 스토어임, 상태, 액션을 가지고 있음 - 커맨드 센터 역할
    let store: StoreOf<CounterFeature>

    public var body: some View {
        CommonView()
        VStack {
          Text("\(store.count)")
                
          HStack {
            Button("-") {
              store.send(.decrementButtonTapped)
            }
            
            Button("+") {
              store.send(.incrementButtonTapped)
            }
          }
        }
    }
}


#Preview {
    CounterView(store: Store(initialState: CounterFeature.State()) {
        CounterFeature()
    })
}
