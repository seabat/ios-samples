import SwiftUI

struct Item: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let description: String
}

struct NavigationLinkAndDestinationModNav: View {
    let items = [
        Item(name: "Item 1", description: "Description 1"),
        Item(name: "Item 2", description: "Description 2"),
        Item(name: "Item 3", description: "Description 3")
    ]
    var body: some View {
        NavigationStack {
            List(items) { item in
                NavigationLink(value: item) {
                    Text(item.name)
                }
            }
            .navigationTitle("Items")
            .navigationDestination(for: Item.self) { item in
                ItemDetailView(item: item)
            }
        }
    }
}

struct ItemDetailView: View {
    let item: Item
    var body: some View {
        VStack {
            Text(item.name)
                .font(.largeTitle)
            Text(item.description)
                .foregroundColor(.secondary)
        }
        .navigationTitle(item.name)
    }
}

#Preview {
    NavigationLinkAndDestinationModNav()
}
