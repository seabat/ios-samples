import SwiftUI

enum Destination: Hashable {
    case profile(User)
    case settings
    case detail(DetailItem)
}

struct User: Hashable {
    let id: Int
    let name: String
}

struct DetailItem: Hashable {
    let id: Int
    let name: String
    let description: String
}

struct MultiScreenPathNav: View {
    // NOTE: NavigationPath vs [Destination]()
    //   ・NavigationPath is type-erased it can hold any Hashable value. Good for heterogeneous navigation.
    //   ・Typed arrays like [Destination] are strongly typed better for compile-time safety when all destinations are known.
    @State private var path = [Destination]()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Button("Profile") {
                    path.append(.profile(User(id: 1, name: "John")))
                }
                Button("Settings") {
                    path.append(.settings)
                }
            }
            .navigationTitle("Home")
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .profile(let user):
                    ProfileScreen(user: user) { item in
                        path.append(.detail(item))
                    }
                case .settings:
                    Text("Settings")
                case .detail(let item):
                    DetailScreen(item: item)
                }
            }
        }
    }
}

struct ProfileScreen: View {
    let user: User
    let onDetailTapped: (DetailItem) -> Void
    var body: some View {
        VStack {
            Text(user.name)
                .font(.largeTitle)
            Text(String(user.id))
                .foregroundColor(.secondary)
            Button("詳細") {
                let item = DetailItem(
                    id: user.id,
                    name: user.name,
                    description: "\(user.name)の詳細情報"
                )
                onDetailTapped(item)
            }
            .buttonStyle(.borderedProminent)
            .padding(.top)
        }
        .navigationTitle(user.name)
    }
}

struct DetailScreen: View {
    let item: DetailItem
    var body: some View {
        VStack {
            Text(item.name)
                .font(.largeTitle)
            Text(item.description)
                .foregroundColor(.secondary)
        }
        .navigationTitle("\(item.name)の詳細")
    }
}

#Preview {
    MultiScreenPathNav()
}
