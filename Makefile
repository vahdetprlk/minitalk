SERVER = server
CLIENT = client

CC = cc
CFLAGS = -Wall -Wextra -Werror -g

SRC_S =   src/server.c
SRC_C =   src/client.c

OBJS_S =  $(SRC_S:.c=.o)
OBJS_C =  $(SRC_C:.c=.o)

LIBFT_DIR = include/libft
LIBFT = $(LIBFT_DIR)/libft.a
LIBFT_INC = -I$(LIBFT_DIR)

all: $(SERVER) $(CLIENT)

$(SERVER): $(OBJS_S) $(LIBFT) $(PRINTF)
	@$(CC) $(CFLAGS) $(OBJS_S) -o $(SERVER)  -L$(LIBFT_DIR) -lft

$(CLIENT): $(OBJS_C) $(LIBFT) $(PRINTF)
	@$(CC) $(CFLAGS) $(OBJS_C) -o $(CLIENT) -L$(LIBFT_DIR) -lft

$(LIBFT):
	@make -C $(LIBFT_DIR)

$(PRINTF):
	@make -C $(PRINTF_DIR)

%.o: %.c
	$(CC) $(CFLAGS) $(LIBFT_INC) -c $< -o $@

all: $(SERVER) $(CLIENT)

clean:
	@make -C $(LIBFT_DIR) clean
	@rm -f $(OBJS_S) $(OBJS_C)

fclean: clean
	@make -C $(LIBFT_DIR) fclean
	@rm -f $(SERVER) $(CLIENT)

re: fclean all

.PHONY: all clean fclean re
