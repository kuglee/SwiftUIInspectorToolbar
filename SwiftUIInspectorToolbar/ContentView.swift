import SwiftUI
import SwiftUINavigation

enum InspectorType: String {
  case isPresented = "isPresented"
  case binding = "binding"
}

struct ContentView: View {
  @State var inspectorType: InspectorType = .isPresented

  var body: some View {
    VStack {
      Button("\(self.inspectorType.rawValue)") {
        self.inspectorType =
          switch self.inspectorType {
          case .isPresented: .binding
          case .binding: .isPresented
          }
      }
      switch self.inspectorType {
      case .isPresented: InspectorIsPresented()
      case .binding: InspectorBinding()
      }
    }
  }
}

struct InspectorIsPresented: View {
  @State var isInspectorPresented = false

  var body: some View {
    EmptyView()
      .inspector(isPresented: self.$isInspectorPresented) {
        Text("Inspector").inspectorColumnWidth(100)
      }
      .toolbar {
        Button(action: { self.isInspectorPresented.toggle() }) {
          Image(systemName: "sidebar.trailing")
        }
      }
  }
}

struct InspectorBinding: View {
  @State var data: Int?

  var body: some View {
    EmptyView().inspector(item: $data) { $data in Text("Inspector").inspectorColumnWidth(100) }
      .toolbar {
        Button(action: { self.data = if self.data != nil { nil } else { 1 } }) {
          Image(systemName: "sidebar.trailing")
        }
      }
  }
}
