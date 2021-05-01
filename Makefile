##
## EPITECH PROJECT, 2018
## ASM
## File description:
## ASM
##

CC	=	ld

ASM	=	nasm

TEST	=	test

ASM_FOLDER	=	./

NAME	=	libasm.so

SRC	=	strlen.asm	\
		strchr.asm	\
		memset.asm	\
		memcpy.asm	\
		strcmp.asm	\
		memmove.asm	\
		strncmp.asm	\
		rindex.asm	\
		strstr.asm	\
		strcspn.asm	\
		strpbrk.asm	\
		strcasecmp.asm	\

OBJ	=	$(addprefix $(ASM_FOLDER), $(SRC:.asm=.o))

%.o: %.asm
	$(ASM) -f elf64 $< -o $@

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) -shared -o $(NAME) $(OBJ)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re:	fclean all

.PHONY: all clean fclean re