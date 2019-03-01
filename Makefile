##
## EPITECH PROJECT, 2019
## deBruijn
## File description:
## Makefile
##

NAME	=	deBruijn

SRC		=	app/Main.hs			\
			src/Utils.hs		\
			src/Unique.hs		\
			src/Check.hs		\
			src/PreferOne.hs	\

all:	$(NAME)

$(NAME): $(SRC)
	stack build --copy-bins --local-bin-path .

clean:
	stack clean
	rm .stack-work deBruijn.cabal -rf

fclean:	clean
	$(RM) $(NAME)

re:	fclean all

.PHONY: all clean fclean re