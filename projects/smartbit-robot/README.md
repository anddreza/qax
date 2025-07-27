## rodar o projeto dessa forma:
~/.local/bin/robot hello.robot


## comanda para rodar e não ficar na raiz do projeto e sim entrar na pasta de logs
~/.local/bin/robot -d ./logs tests/slogan.robot
~/.local/bin/robot -d ./logs -i smoke tests/signup.robot
~/.local/bin/robot -d ./logs/ tests/enrolls.robot

## comando no banco para deletar as informações da massa no banco
DELETE FROM accounts WHERE email = 'example@gmail.com';

## rodar com tags
required é a tag aqui nesse caso
~/.local/bin/robot -d ./logs -i required tests/signup.robot

## como fazer um teste de regressão
~/.local/bin/robot -d ./logs tests/


### instalações 
pip install psycopg2


## limpar tudo e rodar de novo
sudo docker compose down -v
sudo docker compose up --build
xlwcl

## trabalhar com robot e json? 
nova biblioteca

pip install robotframework-jsonlibrary