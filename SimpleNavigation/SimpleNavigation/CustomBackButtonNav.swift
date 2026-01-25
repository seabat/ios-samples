import SwiftUI


struct CustomBackButtonNav: View {
    @State private var path = NavigationPath()

     var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 20) {
                Button("Go to Custom Back Screen") {
                    path.append("CustomBack")
                }
            }
            .navigationTitle("Home")
            .navigationDestination(for: String.self) { screen in
                switch screen {
                case "CustomBack":
                    CustomBackButtonScreen(path: $path)
                default:
                    EmptyView()
                }
            }
        }
    }
}

struct CustomBackButtonScreen: View {
    @Binding var path: NavigationPath

     var body: some View {
        Text("Custom Back Button Screen")
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        path.removeLast()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                    }
                }
            }
            .navigationTitle("Custom Back Button")
    }
}

#Preview {
    NavigationStack {
        CustomBackButtonNav()
    }
}
