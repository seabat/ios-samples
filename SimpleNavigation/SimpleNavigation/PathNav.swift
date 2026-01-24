import SwiftUI

struct PathNav: View {
    @State private var path = NavigationPath()

     var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 20) {
                Button("Go to Screen A") {
                    path.append("A")
                }
                Button("Go to Screen B") {
                    path.append("B")
                }
                Button("Go to A then B") {
                    path.append("A")
                    path.append("B")
                }
                Button("Go Deep (A → B → C)") {
                    path.append("A")
                    path.append("B")
                    path.append("C")
                }
            }
            .navigationTitle("Home")
            .navigationDestination(for: String.self) { value in
                ScreenView(name: value, path: $path)
            }
        }
    }
}

struct ScreenView: View {
    let name: String
    @Binding var path: NavigationPath
    var body: some View {
        VStack(spacing: 20) {
            Text("Screen \(name)")
                .font(.largeTitle)
            Button("Go Back to Root") {
                path.removeLast(path.count)
            }
            Button("Pop One") {
                path.removeLast()
            }
        }
        .navigationTitle("Screen \(name)")
    }
}

#Preview {
    PathNav()
}
