/* - Termos importantes
    
    Adminstrador de Dados ( AD )
    
    Adminstrador de Banco de Dados (DBA)
    
    Business Intellinge ou Inteligência de Negócio (BI)
    
    Big Data
    
    Data Mining ( Mineração de Dados )
    
    Data Science ( Ciência de Dados ). */

-- exercício 
/* A EQUIPE DE MARKETIN PRECISA DE FAZER UMA PESQUISA SOBRE NOMES  MAIS COMUNS DE
SEUS CLIENTES E PRECISA DO NOME E SOBRENOME DE TODOS OS CLIENTES QUE ESTÃO CDASTRADOS 
 NO SISTEMA. */

first name , last name

Resposta:

SELECT FirstName, lastName
FROM person.person;

QUantos sobrenomes únicos temos na tabela?

Para isso vamos usar a função DISTINCT que só mostra resultados diferentes.
SELECT DISTINCT LastName
FROM person.Person

-- WHERE 

SELECT Coluna1, coluna2, coluna_n
FROM tabela
WHERE condicao;
/* hausdhausduhadhs */
/*

OPERADOR - DESCRiÇÃO
=         IGUAL
>         MAIOR QUE
<         MENOR QUE
>=        MAIOR QUE OU IGUAL
<=        MENOR QUE OU IGUAL
<>        DIFERENTE DE
AND       OPERADOR LÓGICO "E"
OR        OPERADOR LÓGICO "OU"
*/

SELECT *
FROM Production.Product
WHERE color <> 'red'


AULA 4


-- exercício 1
/* A equipe de produção de produtos precisa do nome de todas as peças que pesam mais
que 500 kg mas não mais que 700kg para inspeção */
Minhas resposta ↓
SELECT *
FROM Production.Product
WHERE Weight > 500 and Weight < 700

Resposta certa: 

SELECT Name
FROM Production.Product
WHERE Weight > 500 and Weight <= 700

HL Road Front Wheel
LL Crankset
ML Crankset
HL Crankset

-- exercício 2
/* Foi pedido pelo marketing uma relação de todos os empregados (employees) que
 são casados ( single = solteiro, married = casado) e são assalariados (salaried)  */

SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'M' and SalariedFlag = 1

-- exercício 3
/* Um usuário chamado Peter Krebs está devendo um pagamento , consiga o email dele 
para que possamos enviar uma cobrança ! 

BusinessEntityID
( Usar a tabela person.person e depois person.emailaddress ) */

SELECT *
FROM Person.Person
WHERE FirstName = 'peter' and LastName = 'krebs'

SELECT *
FROM  Person.EmailAddress
WHERE BusinessEntityID = 26

Primeiro encontrar o Peter Krabs na tabela para ver as informações dele
Depois pesquisar pela informação do BusinessEntityID na tabela EmailAddress.

Na primeira tabela tinha o ID dele que é 26, e através do 26 conseguimos encontrar 
o email correspondente. Ou seja, ID 26 é o Peter Krabs na tabela BusinessEntityID.


