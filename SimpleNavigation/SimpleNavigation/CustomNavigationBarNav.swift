import SwiftUI

struct CustomNavigationBarNav: View {
    var body: some View {
        NavigationStack {
            List {
                Text("Content")
            }
            .navigationTitle("Custom Nav")
            // .inline: タイトルをナビゲーションバー内に小さく表示（iOS 14以降のデフォルト）
            // .large: タイトルを大きく表示（スクロール時に縮小）
            // .automatic: 前の画面の設定を継承
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        // TODO: Action
                    } label: {
                        Image(systemName: "line.horizontal.3")
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button {
                            // TODO: Action
                        } label: {
                            Image(systemName: "magnifyingglass")
                        }
                        Button {
                            // TODO: Action
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.blue, for: .navigationBar)
            // .dark: ナビゲーションバーをダークモードに（アイコンやテキストが明るい色）
            // .light: ライトモードに（アイコンやテキストが暗い色）
            // .automatic: システムの設定に従う
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

#Preview {
    CustomNavigationBarNav()
}
