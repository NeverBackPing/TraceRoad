# ascii art
BLUE	=	\033[0;34m
GREEN	=	\033[0;32m
RED		=	\033[31m
RESET	=	\033[0m
YELLOW	=	\033[0;33m

define HEADER
░▀█▀░█▀▄░█▀█░█▀▀░█▀▀░█▀▄░█▀█░█▀█░█▀▄
░░█░░█▀▄░█▀█░█░░░█▀▀░█▀▄░█░█░█▀█░█░█
░░▀░░▀░▀░▀░▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀░▀░▀▀░
© sjossain - ft_traceroute 
endef
export HEADER

#programme
NAME= ft_traceroute

# command compile
CC=cc
CFLAGS=-Wall -Wextra -Werror

# Path and target
BUILD_DIR= build
SRC= src/%.c

# File projet
FILE_C = main.c 

# Build
OBJS_DIR= $(BUILD_DIR)/obj

OBJ = $(FILE_C:%.c=$(OBJS_DIR)/%.o)

$(OBJS_DIR)/%.o: $(SRC)
	@mkdir -p $(OBJS_DIR)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

header = "$(BLUE)$$HEADER$(RESET)\n"

# compilation rules
all: $(NAME) 
	@printf $(header)

$(LIB):
	@mkdir -p $(PATH_LIB)
	@$(MAKE) -C dep/libft/

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) $(INCLUDES) $(OBJ) -o $(NAME) -lm

# review
c correction:
	podman build -t debian-local .
	podman run -it --rm --cap-add=NET_RAW debian-local

cj clean-obj:
	rm -rf $(OBJ)

cl clean:
	rm -rf $(OBJ) $(OBJS_DIR) $(BUILD_DIR)

fc fclean: clean
	rm -rf $(NAME) $(PATH_LIB)

re: fclean all

h help:
	@printf "Usage: make [OPTION]\n"
	@printf "Build of project ft_ping\n\n"
	@printf "Mandatory arguments for option.\n"
	@printf "all: compilation rule\n"
	@printf "c correction: create a environement for test the programme\n"
	@printf "cj clean-obj: clean file obj\n"
	@printf "cl clean: clean folder obj and build directory\n"
	@printf "fc fclean: clean build directory, folder lib and programme\n"
	@printf "re: clean all and rebuild\n"
	@printf "sc show-compilation: show the compilation of target\n"
	@printf "h help: show command\n"

sc show-compilation:
	@printf "NAME  		:$(NAME)\n"
	@printf "CC		:$(CC)\n"
	@printf "CFLAGS		:$(CFLAGS)\n"
	@printf "SRC		:$(SRC)\n"
	@printf "OBJ		:$(OBJ)\n"

.PHONY: all show clean-obj clean fclean correction help re