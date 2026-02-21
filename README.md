# Claude Dev Environment

Docker で Claude Code CLI を実行するための開発環境です。Windows、Mac、Linux で一貫した環境を提供します。

## セットアップ

```bash
make build
```

## 認証方法

### Claude Max サブスクリプション

```bash
make login   # 表示される URL をブラウザで開いて認証
make run     # サブスクで起動
```

### API キー

```bash
make setup   # .env ファイルを生成
# .env を編集して ANTHROPIC_API_KEY=sk-ant-... を設定
make run-api # API キーで起動
```

API キーは https://console.anthropic.com/settings/keys から取得できます。

## コマンド一覧

| コマンド | 説明 |
|---------|------|
| `make build` | Docker イメージをビルド |
| `make run` | サブスクで起動 |
| `make run-api` | API キーで起動 |
| `make login` | OAuth 認証（Claude Max 用） |
| `make setup` | `.env` ファイルを生成 |
| `make clean` | イメージとボリュームを削除 |

## ボリューム

- `./workspace`: プロジェクトディレクトリ
- `claude-config`: Claude の設定と認証情報 (`~/.claude`)

## トラブルシューティング

### 認証が切れた

```bash
make login
```

### `make clean` 後に再ログインが必要

`make clean` は Docker ボリュームも削除するため、認証情報がリセットされます。再度 `make login` を実行してください。

## ライセンス

MIT
