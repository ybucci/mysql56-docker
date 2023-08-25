#!/bin/bash

# Nome do contêiner MySQL existente
container_name="mysql"

# Solicitar a senha do usuário root
read -s -p "Digite a senha do usuário root do MySQL: " root_password
echo
echo

while true; do
    # Solicitar o nome do banco de dados
    read -p "Digite o nome do banco de dados (ou 'sair' para finalizar): " db_name
    echo

    if [[ $db_name == "sair" ]]; then
        echo "Finalizando o script."
        exit
    fi

    # Solicitar o nome do usuário
    read -p "Digite o nome do usuário: " db_user

    echo
    # Solicitar a senha do usuário
    read -s -p "Digite a senha para o usuário $db_user: " db_password
    echo

    # Comando para executar comandos MySQL dentro do contêiner
    docker exec -it $container_name mysql -uroot -p$root_password -e "CREATE DATABASE IF NOT EXISTS $db_name; \
        CREATE USER '$db_user'@'localhost' IDENTIFIED BY '$db_password'; \
        GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%'; \
        GRANT ALL PRIVILEGES ON $db_name.* TO 'root'@'%'; \
        FLUSH PRIVILEGES;" > /dev/null
    echo
    echo "Banco de dados '$db_name' e usuário '$db_user' criados com sucesso no contêiner."
    echo
done
