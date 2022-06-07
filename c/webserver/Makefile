# Main makefile 

PROJ_NAME=main

C_SOURCE=$(wildcard ./src/*.c)
H_SOURCE=$(wildcard ./src/*.h)
OBJ=$(subst .c,.o,$(subst src,obj,$(C_SOURCE)))

CC=gcc

CC_FLAGS=-c \
				 -W \
				 -Wall \
				 -ansi \
				 -pedantic

RM=rm -rf

all: objDir $(PROJ_NAME)

$(PROJ_NAME): $(OBJ)
	$(CC) $^ -o $@

./obj/%.o: ./src/%.c ./src/%.h
	$(CC) $< $(CC_FLAGS) -o $@

./obj/main.o: ./src/main.c $(H_SOURCE)
	$(CC) $< $(CC_FLAGS) -o $@

objDir:
	@ mkdir -p obj

clean:
	@ $(RM) ./obj/*.o $(PROJ_NAME) *~
	@ rmdir obj

.MAIN: all clean
