import SwiftUI

struct NavigatinViewNav: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Go to Detail", destination: NavigatinDetailView())

                NavigationLink(destination: NavigatinSettingsView()) {
                    Label("Settings", systemImage: "gear")
                }
            }
            .navigationTitle("Home")
        }
        .navigationViewStyle(.stack)
    }
}

struct NavigatinDetailView: View {
    var body: some View {
        Text("Detail View")
            .navigationTitle("Detail")
    }
}

struct NavigatinSettingsView: View {
    var body: some View {
        Text("Settings View")
            .navigationTitle("Settings")
    }
}

#Preview {
    NavigatinViewNav()
}
