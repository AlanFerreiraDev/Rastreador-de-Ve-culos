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

Explicacoes em portugues (com exemplos de commit em ingles):

- `build`: mudancas de build, dependencias ou empacotamento.
  Exemplo: `build(deps): update kafka client version`
- `chore`: tarefas internas sem impacto direto de funcionalidade.
  Exemplo: `chore(repo): update git hooks setup`
- `ci`: mudancas em pipeline, workflow ou automacao de CI/CD.
  Exemplo: `ci(github-actions): add commit validation job`
- `docs`: alteracoes apenas de documentacao.
  Exemplo: `docs(readme): add commit message templates`
- `feat`: nova funcionalidade.
  Exemplo: `feat(tracking): add endpoint to list active vehicles`
- `fix`: correcao de bug.
  Exemplo: `fix(api): handle null tracker id on startup`
- `perf`: melhoria de performance sem mudar comportamento funcional.
  Exemplo: `perf(query): optimize vehicle search with index`
- `refactor`: reorganizacao de codigo sem mudar comportamento externo.
  Exemplo: `refactor(service): split tracking service responsibilities`
- `revert`: desfaz um commit anterior.
  Exemplo: `revert: revert "feat(tracking): add endpoint to list active vehicles"`
- `style`: mudancas de formatacao/estilo (sem alterar logica).
  Exemplo: `style(lint): run code formatting rules`
- `test`: criacao ou ajuste de testes.
  Exemplo: `test(tracking): add unit tests for gps parser`

Template para breaking change:

```text
feat(tracking)!: change location payload schema
```
