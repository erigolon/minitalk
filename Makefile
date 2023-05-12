# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: erigolon <erigolon@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/08 15:04:26 by erigolon          #+#    #+#              #
#    Updated: 2023/05/09 16:26:17 by erigolon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= server
NAME2		= client
NAME_BONUS		= server_bonus
NAME_BONUS2		= client_bonus

SERVER		= server.c
CLIENT		= client.c
SERVER_BONUS		= server_bonus.c
CLIENT_BONUS		= client_bonus.c

LIBFT		= ./libft
LIBPRINTF	= ./ft_printf

HEADER		= -I ./includes
LIBS		= ${LIBFT}/libft.a ${LIBPRINTF}/libftprintf.a

OBJS_S		= ${SERVER:.c=.o}
OBJS_C		= ${CLIENT:.c=.o}
OBJS_BON_S		= ${SERVER_BONUS:.c=.o}
OBJS_BON_C		= ${CLIENT_BONUS:.c=.o}

CC			= gcc
FLAGS		= -Wall -Werror -Wextra

RM			= rm -f

all: libs ${NAME} ${NAME2}

libs:
	@${MAKE} -C ${LIBPRINTF}
	@${MAKE} -C ${LIBFT}

${NAME}: ${OBJS_S}
	@${CC} ${FLAGS} ${OBJS_S} ${HEADER} ${LIBS}  -o ${NAME}

${NAME2}: ${OBJS_C}
	@${CC} ${FLAGS} ${OBJS_C} ${HEADER} ${LIBS}  -o ${NAME2}

bonus: libs ${NAME_BONUS} ${NAME_BONUS2}

${NAME_BONUS}: ${OBJS_BON_S}
	@${CC} ${FLAGS} ${OBJS_BON_S} ${HEADER} ${LIBS}  -o ${NAME_BONUS}

${NAME_BONUS2}: ${OBJS_BON_C}
	@${CC} ${FLAGS} ${OBJS_BON_C} ${HEADER} ${LIBS}  -o ${NAME_BONUS2}

clean:
	@${RM} ${OBJS_S}
	@${RM} ${OBJS_C}
	@${RM} ${OBJS_BON_S}
	@${RM} ${OBJS_BON_C}
	@${MAKE} -C ${LIBFT} clean
	@${MAKE} -C ${LIBPRINTF} clean

fclean: clean
	@${RM} ${NAME}
	@${RM} ${NAME2}
	@${RM} ${NAME_BONUS}
	@${RM} ${NAME_BONUS2}
	@${MAKE} -C ${LIBFT} fclean
	@${MAKE} -C ${LIBPRINTF} fclean
	
re: fclean all

.PHONY: all, clean, fclean, re, libs
