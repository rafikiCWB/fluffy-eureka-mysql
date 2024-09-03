# Use a imagem oficial do MySQL como base
FROM mysql:latest

# Defina as variáveis de ambiente
ENV MYSQL_DATABASE=sistema_gestao_escolar
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_USER=root

# Exponha a porta padrão do MySQL
EXPOSE 3306

# Comando Para inicial o MySQL
CMD ["mysqld"]