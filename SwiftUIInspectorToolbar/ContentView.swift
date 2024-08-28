import SwiftUI
import SwiftUINavigation

struct ContentView: View {
  var body: some View {
    EmptyView()

      // THE TOOLBAR BUTTON IS VISIBLE
      .inspector(isPresented: self.$isInspectorPresented) {
        Text("Inspector")
          .toolbar {
            Spacer()
            Button(action: { self.isInspectorPresented.toggle() }) {
              Image(systemName: "sidebar.trailing")
            }
          }
      }

    // THE TOOLBAR BUTTON IS NOT VISIBLE
    //      .inspector(item: $data) { $data in
    //        Text("Inspector")
    //          .toolbar {
    //            Spacer()
    //            Button(action: { self.data = if self.data != nil { nil } else { 1 } }) {
    //              Image(systemName: "sidebar.trailing")
    //            }
    //          }
    //      }
  }

  @State var data: Int?
  @State var isInspectorPresented = false
}
