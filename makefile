CC ?= gcc
CFLAGS = -Wall -g -I $(INC)

SRC = src
INC = include
BUILD = build
BIN = bin

SRCS := $(wildcard $(SRC)/*.c)
OBJS := $(patsubst $(SRC)/%.c,$(BUILD)/%.o,$(SRCS))

TARGET := $(BIN)/masochistboy

# Auto-detect target OS or manually set TARGET_OS
ifeq ($(OS),Windows_NT)
    TARGET_OS := windows
else
    TARGET_OS := linux
endif

# Adjust settings based on OS
ifeq ($(TARGET_OS),windows)
    EXE_EXT := .exe
    MKDIR_CMD = if not exist $(BUILD) mkdir $(BUILD) & if not exist $(BIN) mkdir $(BIN)
    RM_CMD = if exist $(BUILD) del /F /Q $(BUILD)\* & if exist $(BIN) del /F /Q $(BIN)\*
    CFLAGS += -DWINDOWS_BUILD
else
    EXE_EXT :=
    MKDIR_CMD = mkdir -p $(BUILD) $(BIN)
    RM_CMD = rm -rf $(BUILD)/* $(BIN)/*
endif

TARGET := $(BIN)/masochistboy$(EXE_EXT)

# Default target
all: $(TARGET)

# Build target executable
$(TARGET): $(OBJS)
	$(MKDIR_CMD)
	$(CC) $(CFLAGS) -o $@ $^

# Compile source files to object files
$(BUILD)/%.o: $(SRC)/%.c
	$(MKDIR_CMD)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up build artifacts
clean:
	$(RM_CMD)