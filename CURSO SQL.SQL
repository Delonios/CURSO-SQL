/* - Termos importantes
    
    Adminstrador de Dados ( AD )
    
    Adminstrador de Banco de Dados (DBA)
    
    Business Intellinge ou Inteligência de Negócio (BI)
    
    Big Data
    
    Data Mining ( Mineração de Dados )
    
    Data Science ( Ciência de Dados ). */

-- exercício 
/* A EQUIPE DE MARKETINg PRECISA DE FAZER UMA PESQUISA SOBRE NOMES  MAIS COMUNS DE
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

Aula 05 - Count

-- Count
SELECT COUNT(*)
FROM TABELA

SELECT Count(tittle)
FROM person.Person

SELECT count(DISTINCT title)
FROM person.Person

/*DESAFIO 1 
Quantos Produtos temos cadastrados em nossa tabela de produtos (produciont.product).
*/
SELECT count(*)
FROM Production.Product

R: 504

/*DESAFIO 2 

Quantos tamanhos de produtos temos cadastrado em nossa tabela (production.product).
*/
SELECT count(size)
FROM Production.Product
R: 211

/*DESAFIO 3

Quantos tamanhos diferentes de produtos temos cadastrados em nossa tavela.
(production.product)
*/

SELECT count(DISTINCT size)
FROM Production.Product

R: 18.

AULA 06

-- TOP

SELECT TOP 10 *
FROM Production.Product

-- retorna o os 10 primeiros itens da tabela. 

Aula 07

-- ORDER BY

SELECT *
FROM Person.Person
ORDER BY FirstName asc -- ascendente ( organiza os nomes em ordem crescente).

SELECT * -- * indica que está mostrando todas as colunas. 
FROM Person.Person
ORDER BY FirstName desc -- descendente ( organiza os nomes em ordem descendente).

SELECT FirstName, LastName -- Visualmente falando estaremos vendo só as 2 colunas.
FROM Person.Person
ORDER BY FirstName asc, LastName desc


-- DESAFIO 1

/* Obter o ProductId dos 10 produtos mais caros cadastrados no sistema, listando do mais caro para o mais barato.*/

/* Dicas: 
Usar a tabela Production.product
Usar o ORDER BY e TOP
USAR ORDER BY ASC ou DESC dependendo do resultado que está buscando.*/

R:
SELECT TOP 10 ProductID
FROM Production.Product
ORDER BY ListPrice desc

-- DESAFIO 2 

/* Obter o nome e o número do produto dos produtos que tem o ProductID entre 1~4*/

R:

SELECT Name, ProductNumber
FROM Production.Product
WHERE ProductID >= '1' and ProductID <= '4'

Correção:

SELECT TOP 4 name, productNumber
FROM Production.Product
ORDER BY ProductID asc

AULA 08 

-- BETWEEN

é usado para encontrar o valor entre o valor mínimo e máximo.

valor BETWEEN mínimo AND máximo;

valor >= mínimo and valor <= máximo;

SELECT *
FROM Production.Product
WHERE ListPrice between 1000 and 1500;

SELECT *
FROM Production.Product
WHERE ListPrice NOT between 1000 and 1500;

SELECT *
FROM HumanResources.Employee
where HireDate BETWEEN '2009/01/01' and '2010/01/01'
order by HireDate

---------------------------------------------

AULA 09

-- IN

Operador normalmente utilizado junto com o WHERE,

Para verificar se um valor corresponde com qualquer valor passado na lista de
valoes.

Valor in ( valor1,valor2)
Valor IN (SELECT valor from NomedaTabela)

---------------------------------------------

SELECT *
FROM Person.Person
where BusinessEntityID in (2,7,13)

SELECT *
FROM Person.Person
where BusinessEntityID NOT in (2,7,13)

Usar o IN otimiza seu código e faz com que ele retorne mais rápido a informação
do que usar mais linhas de código como no exemplo à seguir que retornaria o mesmo
resultado:

SELECT *
FROM Person.Person
where BusinessEntityID = 2
OR BusinessEntityID = 7
OR BusinessEntityID = 13

-----------------------------------------------

AULA 10 - LIKE

Você precisa encontrar uma pessoa no banco de dados que você sabe que o nome dela
era OVI...alguma coisa.

SELECT *
FROM Person.Person
where FirstName like 'ovi%' -- você lembra o começo do nome e não lembra o final

SELECT *
FROM Person.Person
where FirstName like '%to' -- você lembra o final do nome e não lembra o começo.

SELECT *
FROM Person.Person
where FirstName like '%essa%' -- dessa forma ele completa o inicio e o final.

SELECT *
FROM Person.Person
where FirstName like '%to' -- você lembra o final do nome e não lembra o começo.

SELECT *
FROM Person.Person
where FirstName like '%ro_' - Quando você usa o _ ele busca ao limite de 1 caractere.
por exemplo: SHARON -- no lugar do % entrou 3 caracteres e no lugar do _ entrou 1.

------------------------------------------------------------------------------------

AULA 11

DESAFIO FUNDAMENTOS SQL

1- Quantos produtos temos cadastrado no sistema que custam mais que 1500 dolares ?

DiCAS: Usar a tabela production.product
usar o count where e mais algum operador de comparação.

R: 
SELECT count(listprice)
FROM Production.Product
where ListPrice > 1500

2- Quantas pessoas temos com o sobrenome que inicia com a Letra P ?

DICAS: Usar a tabela person.person
usar o Count, where e Like.

R: 
SELECT count(LastName)
FROM person.Person
where LastName like 'p%'

3 - em quantas cidades unicas estão cadastrados nossos clientes ?

DICAS: Usar a tabela person.Address
usar o count, distinct.

R:
SELECT count(distinct(city))
FROM person.Address

4 - Quais são as cidades únicas cadastradas no sistema.
Usar a tabela person.Address

R:
SELECT distinct(city)
FROM person.Address

5 - Quantos produtos vermelhos tem o preço entre 500 a 1000 dólares.

DICAS: usar a tabela production.product
Usar where e between.

R:
SELECT*
FROM Production.Product
where color = 'red' and ListPrice between 500 and 1000

Correção:

SELECT COUNT (*)
FROM Production.Product
where color = 'red' 
and ListPrice between 500 and 1000 

Comentário, falta de atenção ao resultado obtido e a proposta do enúnciado.

6 - Quantos produtos cadastrados tem a palavra 'road' no nome deles ?

DICAS: usar a tabela production.product
usar count, like.

R: SELECT count(*)
FROM Production.Product
where Name like '%road%'

-------------------------------------------------------------------------------

AULA 12 - MIN MAX SUM AVG

funções de agregação basicamente agregam ou combinam dados de uma tabela em 1 um 
resultado só.

exemplo de soma de uma coluna

SELECT top 10 sum(linetotal)
from sales.SalesOrderDetail

podemos adicionar um apelido para essa nova coluna que foi criada à partir da soma
dos dados, incluindo " as 'apelido' "

exemplo:

SELECT top 10 sum(linetotal) as 'Soma'
from sales.SalesOrderDetail0

-----

podemos escolher também apenas o menor valor dessa coluna usando o operador Min

SELECT top 10 min(linetotal)
from sales.SalesOrderDetail

ou o maior valor utilizando o operador MAX

SELECT top 10 max(linetotal)
from sales.SalesOrderDetail

e podemos também retornar a média usando o operador AVG

SELECT top 10 AVG(linetotal)
from sales.SalesOrderDetail


-------------------------------------------------------------------------------

AULA 13 - GROUP BY

- O Group BY basicamente divide o resultado da sua pesquisa em grupos
- Para cada grupo você pode aplicar uma função de agregação, por exemplo:
    -Calcular a soma de itens
    -Contar o número de itens naquele grupo.

Exemplo:
SELECT coluna1,funcaoAgregacao(coluna2)
FROM NomedaTabela
GROUP BY Coluna1;

SELECT *
FROM SALES.SalesOrderDetail

SELECT SpecialOfferID, SUM(UnitPrice) as 'SOMA'
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID

SELECT SpecialOfferID
FROM Sales.SalesOrderDetail
WHERE SpecialOfferID = 9 

-- Quantos cada produto foi vendido até hoje?

SELECT ProductID, Count( ProductID) as 'contagem'
FROM Sales.SalesOrderDetail
GROUP BY ProductID

-- Quantos nomes de cada nome temos cadastrado no banco de dados ?

SELECT FirstName, count(firstname) as 'contagem'
FROM Person.Person
Group By FirstName

-- Na tabela production.product eu quero saber a média de preço para os produtos que
--são prata ( silver )

SELECT color, avg(listprice) as 'preço'
FROM Production.Product
where Color = 'Silver'
Group by color

DESAFIOS 

1 - Quantas pessoas tem o mesmo MiddleName Agrupadas por o MiddleName
DICAS: usar tabela Person.Person
usar Group BY e uma função de agregação.

R:
SELECT MiddleName,sadasdamiddlename) as 'Same MiddleName'
From Person.Person
Group by MiddleName 

2 - Qual é a média da quantidade(quantity) que cada produto é vendido na loja.
DICAS: Usar tabela sales.SalesOrderDetail
Usar group BY e uma função de agregação.

R:
SELECT OrderQty, avg(orderQty) as 'Media'
FROM sales.SalesOrderDetail
group by OrderQty

Correção

SELECT ProductID, avg(orderQty) as 'Media'
FROM sales.SalesOrderDetail
group by ProdutctID

3- Qual foram as 10 vendas que no total tiveram os maiores valores de venda
(line total) por produto do maior valor para o menor.
DICAS: Usar a tabela Sales.SalesOrderDetail
Se atentar a por que você está ordenando.

R:
SELECT top 10 LineTotal
FROM sales.SalesOrderDetail
Group By LineTotal
Order by LineTotal Desc

Correção:

SELECT top 10 ProductID, Sum(linetotal) as 'Soma'
FROM sales.SalesOrderDetail
Group By ProductID
Order by SUM(Linetotal) Desc;

4 - Quantos produtos e qual a quantidade média de produtos temos cadastrados nas nossas ordens 
de serviço (WorkerOrder), agrupados por ProductID

DICAS: Usar a tabela Production.WorkerOrder
Usar GroupBy e uma função de agregação.

R: 
SELECT Count(ProductID), avg (WorkOrderID) as 'média'
FROM Production.WorkOrder
Group by ProductID

Correção:
SELECT ProductID, Count(Productid) 'contagem',
Avg(orderqty) as 'Media'
FROM Production.WorkOrder
Group by ProductID

-----------------------------------------------------------------------------

AULA 14 - HAVING

é usado juntamento com GROUP BY para filtrar resultados de um agrupamento.

de uma forma mais simples é um WHERE para dados agrupados.

SELECT Coluna1, FuncaoAgregação (coluna2)
FROM nameTabela
GROUP BY Coluna1
HAVING condicao;

A GRANDE DIFERENÇA ENTRE HAVING e WHERE
é que o GROUP BY é aplicado depois que os dados já foram agrupados, enquanto O
WHERE é aplicado antes dos dados serem agrupados.

Vamos dizer que queremos saber quais nomes no sistema tem uma ocorrência maior
que 10 vezes.

SELECT FirstName, Count(FirstName) as "quantidade"
from person.Person
group by FirstName
having count(firstname) > 10.

Não seria possível fazer isso usando o Where, por exemplo:

ELECT FirstName, Count (firstName) as "Quantidade"
From Person.person
where Count(FirstName) > 10

vai dar erro por que é necessário usar uma função para fazer uma filtragem extra em dados já filtrados.

"segundo nível de filtro"

-- Por exemplo quais produtos que no total de vendas estão entre 162k a 500k

SELECT top 10 *
From Sales.SalesOrderDetail

SELECT Productid, Sum(linetotal) as "total"
FROM sales.SalesOrderDetail
GRoup BY ProductID
HAVING SUM(linetotal) between 162000 and 500000

-- Quais nomes no sistema tem uma ocorrencia maior que 10 vezes, porem somente 
--onde o título é 'Mr.'

SELECT FirstName, Count(firstname) as 'quantidade'
FROM Person.Person
where Title = 'Mr.'
Group by FirstName
having Count(FirstName) > 10






