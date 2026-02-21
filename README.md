# Claude Dev Environment

Docker で Claude Code CLI を実行するための開発環境です。Windows、Mac、Linux で一貫した環境を提供します。

## セットアップ

### 1. 初期設定

```bash
make setup
```

`.env` ファイルを生成して、`ANTHROPIC_API_KEY` を設定してください。

### 2. ビルド

```bash
make build
```

Docker イメージをビルドします。

### 3. 実行

```bash
make run
```

Claude Code CLI を起動します。

## コマンド一覧

| コマンド | 説明 |
|---------|------|
| `make setup` | `.env` ファイルを生成 |
| `make build` | Docker イメージをビルド |
| `make run` | Claude Code CLI を起動 |
| `make clean` | イメージとボリュームを削除 |

## ボリューム

- `./workspace`: プロジェクトディレクトリ
- `claude-config`: Claude の設定ディレクトリ (`~/.claude`)

## トラブルシューティング

### API キーが認識されない

`.env` ファイルに正しい `ANTHROPIC_API_KEY` が設定されているか確認してください。

```bash
cat .env
```

### イメージの再ビルドが必要

```bash
make clean
make build
```

## ライセンス

MIT
