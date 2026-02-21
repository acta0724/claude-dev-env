# Claude Dev Environment

Docker で Claude Code CLI を実行するための開発環境です。Windows、Mac、Linux で一貫した環境を提供します。

## 認証方法

### 方法 A: Claude Max サブスクリプション（推奨）

追加の API コストなしで利用できます。

```bash
make build
make login
```

表示される URL をブラウザで開いて認証してください。認証情報は Docker ボリュームに保存されるため、次回以降は不要です。

### 方法 B: API キー

従量課金で利用します。

```bash
make setup   # .env ファイルを生成
# .env を編集して ANTHROPIC_API_KEY=sk-ant-... を設定
make build
```

API キーは https://console.anthropic.com/settings/keys から取得できます。

## 実行

```bash
make run
```

## コマンド一覧

| コマンド | 説明 |
|---------|------|
| `make setup` | `.env` ファイルを生成 |
| `make build` | Docker イメージをビルド |
| `make run` | Claude Code CLI を起動 |
| `make login` | OAuth 認証（Claude Max 用） |
| `make clean` | イメージとボリュームを削除 |

## ボリューム

- `./workspace`: プロジェクトディレクトリ
- `claude-config`: Claude の設定ディレクトリ (`~/.claude`)。認証情報もここに保存されます。

## トラブルシューティング

### 認証が切れた

```bash
make login
```

### イメージの再ビルドが必要

```bash
make clean
make build
```

### `make clean` 後に再ログインが必要

`make clean` は Docker ボリュームも削除するため、認証情報がリセットされます。再度 `make login` を実行してください。

## ライセンス

MIT
