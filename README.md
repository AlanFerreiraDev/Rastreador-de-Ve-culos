# Rastreador de Veiculos

Estrutura inicial do repositório com diretórios para:

- go
- kafka
- nestjs
- nextjs

## Conventional Commits para todos

Este repositorio tem uma ferramenta de commit padrao com validacao:

- `scripts/commit.sh`: cria commit no padrao Conventional Commits.
- `.githooks/commit-msg`: bloqueia commit invalido.
- `scripts/validate-commit-msg.sh`: regra central de validacao.

### Ativar hooks (cada colaborador executa 1x)

```bash
./scripts/setup-hooks.sh
```

Esse setup tambem cria o alias:

```bash
git cc
```

### Fazer commit com a ferramenta

```bash
git add .
./scripts/commit.sh
```

Tambem e possivel passar a mensagem direto:

```bash
./scripts/commit.sh "feat(api): add vehicle tracking endpoint"
```

Com alias:

```bash
git add .
git cc
```

Se a mensagem nao seguir Conventional Commits, o commit e recusado.

### Templates de commit por tipo

Formato base:

```text
<tipo>(<escopo-opcional>): <descricao-curta>
```

Exemplos prontos para copiar e adaptar:

```text
build(deps): update kafka client version
chore(repo): update git hooks setup
ci(github-actions): add commit validation job
docs(readme): add commit message templates
feat(tracking): add endpoint to list active vehicles
fix(api): handle null tracker id on startup
perf(query): optimize vehicle search with index
refactor(service): split tracking service responsibilities
revert: revert "feat(tracking): add endpoint to list active vehicles"
style(lint): run code formatting rules
test(tracking): add unit tests for gps parser
```

Template para breaking change:

```text
feat(tracking)!: change location payload schema
```
