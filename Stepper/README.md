# Stepper

Stepperは、iOSアプリケーションの登録プロセスを段階的に管理するためのアプリケーションです。

Medium 記事 
[Stepper in SwiftUI](https://blog.stackademic.com/stepper-in-swiftui-8e29e3e1c084) をほぼそのまま実装。

<img src="images/screenshot.png" width="250px">

## 機能

- 登録プロセスの各ステージを視覚的に表示
- ステージごとの進捗状況の管理
- モダンで使いやすいUI
- SwiftUIを使用した最新のiOS開発手法の採用

## 技術スタック

- SwiftUI
- Swift
- MVVMアーキテクチャ

## 必要条件

- iOS 15.0以上
- Xcode 13.0以上
- Swift 5.5以上

## プロジェクト構成

- `StepperApp.swift`: アプリケーションのエントリーポイント
- `RegistrationStage.swift`: 登録ステージの定義
- `RegistrationViewModel.swift`: 登録プロセスのビジネスロジック
- `RegistrationStatusView.swift`: 登録ステータスの表示
- `StageRowView.swift`: 各ステージの表示コンポーネント

## セットアップ

1. リポジトリをクローン
2. Xcodeでプロジェクトを開く
3. ビルドして実行
