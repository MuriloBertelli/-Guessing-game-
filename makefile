# Makefile para projeto "jogo da adivinhacao"
CC := gcc
CFLAGS := -Wall -Wextra -Wpedantic -std=c11
DBGFLAGS := -g -O0
RELEASEFLAGS := -O2

SRC_ADVS := FOR/advs.c
SRC_LEVELS := while/while.C

BIN_DIR := bin
BIN_ADVS := $(BIN_DIR)/advs
BIN_LEVELS := $(BIN_DIR)/levels

.PHONY: all debug release run_advs run_levels test clean dirs

all: dirs $(BIN_ADVS) $(BIN_LEVELS)

# debug build (inclui símbolos)
debug: CFLAGS += $(DBGFLAGS)
debug: all

# release build (otimizado)
release: CFLAGS += $(RELEASEFLAGS)
release: all

dirs:
	@mkdir -p $(BIN_DIR)

# Compila FOR/advs.c
$(BIN_ADVS): $(SRC_ADVS)
	@echo "Compilando $< -> $@"
	$(CC) $(CFLAGS) $< -o $@

# Compila while/while.C (força tratamento como C caso extensão .C)
$(BIN_LEVELS): $(SRC_LEVELS)
	@echo "Compilando $< -> $@"
	$(CC) $(CFLAGS) -x c $< -o $@

run_advs: $(BIN_ADVS)
	@echo "Executando $(BIN_ADVS)"
	$(BIN_ADVS)

run_levels: $(BIN_LEVELS)
	@echo "Executando $(BIN_LEVELS)"
	$(BIN_LEVELS)

# exemplo simples de "test" com casos fixos (rodar ambos)
test: all
	@echo "Teste rápido: advs (entrada: 42)"
	@printf "42\n" | $(BIN_ADVS) || true
	@echo "Teste rápido: levels (interação manual - escolha nível e chutes)"
	@echo "-> Rode make run_levels para testar manualmente."

clean:
	@echo "Removendo binários..."
	@rm -rf $(BIN_DIR)
