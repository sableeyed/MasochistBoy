CC = gcc
CFLAGS = -Wall -g -I $(INC)
SRC = src
INC = include
BUILD = build
BIN = bin

all: masochistboy

clean:
	rm -rf *.o masochistboy
	rm -rf $(BUILD)/*
	rm -rf $(BIN)/*

cpu.o: $(SRC)/cpu.c $(INC)/cpu.h
	$(CC) $(CFLAGS) -c $(SRC)/cpu.c -o $(BUILD)/cpu.o

masochistboy.o: $(SRC)/main.c $(INC)/cpu.h
	$(CC) $(CFLAGS) -c $(SRC)/main.c -o $(BUILD)/masochistboy.o

masochistboy: masochistboy.o cpu.o
	$(CC) $(CFLAGS) -o $(BIN)/masochistboy $(BUILD)/masochistboy.o $(BUILD)/cpu.o