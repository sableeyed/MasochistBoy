# CC = gcc
# CFLAGS = -Wall -g -I $(INC)
# SRC = src
# INC = include
# BUILD = build
# BIN = bin

# all: masochistboy

# clean:
# 	rm -rf *.o masochistboy
# 	rm -rf $(BUILD)/*
# 	rm -rf $(BIN)/*

# cpu.o: $(SRC)/cpu.c $(INC)/cpu.h
# 	$(CC) $(CFLAGS) -c $(SRC)/cpu.c -o $(BUILD)/cpu.o

# masochistboy.o: $(SRC)/main.c $(INC)/cpu.h
# 	$(CC) $(CFLAGS) -c $(SRC)/main.c -o $(BUILD)/masochistboy.o

# masochistboy: masochistboy.o cpu.o
# 	$(CC) $(CFLAGS) -o $(BIN)/masochistboy $(BUILD)/masochistboy.o $(BUILD)/cpu.o


CC ?= gcc              # Use gcc by default; can override (e.g., CC=x86_64-w64-mingw32-gcc)
CFLAGS = -Wall -g -I $(INC)

SRC = src
INC = include
BUILD = build
BIN = bin

SRCS := $(wildcard $(SRC)/*.c)
OBJS := $(patsubst $(SRC)/%.c,$(BUILD)/%.o,$(SRCS))

TARGET := $(BIN)/masochistboy

# Allow target OS selection (optional)
TARGET_OS ?= native     # can be "native", "windows", "linux"

# Adjust flags per OS (optional)
ifeq ($(TARGET_OS),windows)
    EXE_EXT := .exe
    CFLAGS += -DWINDOWS_BUILD
else
    EXE_EXT :=
endif

TARGET := $(BIN)/masochistboy$(EXE_EXT)

all: $(TARGET)

$(TARGET): $(OBJS)
	@mkdir -p $(BIN)
	$(CC) $(CFLAGS) -o $@ $^

$(BUILD)/%.o: $(SRC)/%.c
	@mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD)/*
	rm -rf $(BIN)/*
