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

DESAFIOS ( nível intermediário ):

1 - Estamos querendo identificar as provincias (stateProvinceId) com o maior 
número de cadastros no nosso sistema, então é preciso encontrar quais províncias
(stateProvinceId) estão registradas no banco de dados mais que 1000 vezes.
DICAS: usar tabela person.Address
Usar having, count e operadores matemáticos.

R:
SELECT StateProvinceID, count(stateProvinceID) 'contagem'
from Person.Address
group by StateProvinceID
having sum(StateProvinceID) >= 1000

Correção:

SELECT StateProvinceID, count(stateProvinceID) 'contagem'
from Person.Address
group by StateProvinceID
having COUNT(StateProvinceID) > 1000

2 -  Sendo que se trata de uma multinacional os gerentes querem saber quais produtos
(productID) não estão trazendo em média no mínimo 1 milhão em total de vendas ( lineTotal)
DICAS: Usar tabela sales.SalesOrderDetail
usar having, count, e operadores matemáticos 

R:
SELECT ProductID, AVG (linetotal)
FROM Sales.SalesOrderDetail
GROUP BY Linetotal
Having Avg (lineTotal) > 100000

Correção:

SELECT ProductID, AVG (linetotal)
FROM Sales.SalesOrderDetail
GROUP BY ProductID
Having Avg (lineTotal) < 1000000

Aula 15 - AS

As serve para renomear colunas e selects.

Exemplos:

SELECT TOP 10 listprice 'preço'
from Production.Product

renomeia o ListPrice para preço

SELECT TOP 10 avg( listprice) 'preço médio'
from Production.Product


Desafio:

1 - Encontrar o FirstName e o LastName na tabela Person.Person e renomear para o portugues.
R:
SELECT FirstName as "Primeiro Nome", LastName as "Sobrenome"
from Person.Person

2 - ProductNumber da table producion.product "Número do Produto"
R: 
SELECT ProductNumber as "Número do produto"
from Production.Product

3 - Sales.SalesOrderDetail UnitPrice "Preço Unitário"
R:
SELECT UnitPrice as "preço unitário"
from Sales.SalesOrderDetail


Aula - 16 INNER JOIN

Exitem 3 tipos de Joins: INNER JOIN, OUTER JOIN e SELF JOIN. Normalmente utilizados para juntos informações
complementares entre tabelas, por exemplo em uma tabela com dados de clientes tem o Nome do Clinete,
o ID do Cliente e o EndereçoID, e em outra trabela tem O EndereçoID o Nome da Rua do cliente e a cidade.
Usando Join podemos complementar dados de uma tabela com dados de outra tabela.

SELECT C.ClienteID, C.Nome, E.Rua, E.Cidade
FROM Clinete C
INNER JOIN Endereco E ON E.EnderecoID = C.EnderecoId

-- BusinessEntityId, FirstName, LastName, EmailAdress
SELECT TOP 10*
FROM Person.Person

SELECT TOP 10*
FROM Person.EmailAddress

---------------------------------------------------------

SELECT p.BusinessEntityID,p.FirstName,p.LastName, pe.EmailAddress
FROM Person.Person as P
INNER JOIN Person.EmailAddress PE on p.BusinessEntityID = pe.BusinessEntityID

------------------------------------------------------------

Vamos dizer que nós queremos os nomes dos produtos e as informações
de suas subcategorias
ListPrice, Nome do produto, Nome da subcategoria.

SELECT TOP *
FROM Product.Product

SELECT TOP 10 *
FROM Production.ProductSubCategory

-----------------------------------------------------------------------------

Select Top 10 *
FROM person.BusinessEntityAdress

Select top 10 *
FROM Person.Address 

## Quando nós juntamos todas as colunas de 2 tabelas em uma linha, chamamos de PLANO CARTESIANO. ##

SELECT top 10 * ( aqui nao foi especificado quais colunas nós queremos selecionar, então serão mostradas todas as colunas que possuam dados)
FROM   Person.BusinessEntityAdress BA 
INNER JOIN Person.Address PA ON PA.AddressID = BA.AddressID

- DESAFIO 

1.

Trazer uma tabela com os seguintes dados Nessa ordem:

-- BusinesEntityID, Name, PhoneNumberTypeId, PhoneNumber

SELECT TOP 10 *
FROM Person.PhoneNumberType

SELECT TOP 10 *
FROM person.PersonPhone

DICAS: USAR TABELAS PERSON.PhoneNumberType e person.PersonPhone
USAR O JOIN ENCONTRANDO QUAIS COLUNAS TEM EM COMUM NAS DUAS TABELAS.

R:
SELECT TOP 10*
FROM Person.PhoneNumberType

Select top 10 *
From Person.PersonPhone

Select pp.BusinessEntityID, ppt.name, ppt.PhoneNumberTypeID, pp.PhoneNumber
from Person.personPhone PP
INNER JOIN Person.PhoneNumberType PPT on PPT.PhoneNumberTypeID = pp.PhoneNumberTypeID

2.

Trazer o AddressID, City, StateProvinceID, Name (nome do estado.)

R: 
Select PA.AddressID, PA.City, PSP.StateProvinceID, PSP.Name
FROM Person.Address PA
INNER JOIN Person.StateProvince PSP ON PSP.StateProvinceID = PA.StateProvinceID

Aula 17 - Conceito de Joins

Inner Join

Retorna apenas os Resultados que correspondem ( existem ) tanto na tabela A como
na Tabela B.
(ou seja, ele poe só o que tem em comum na A e na B).
EX.

SELECT *
FROM tabelaA
Inner JOIN TabelaB On TabelaA.nome = TabelaB.nome
id | nome   | id | nome
1    ROBO     2    ROBO
3    Samurai  4    Samurai

Full OUTER JOIN 
Retorna um conjunto de todos os registros correspondentes da tabelaA e tabelaB quando são iguais. 
E além disso se Não houver valoes correspondentes, ele simplesmente ira
preencher esse lado com "null".
(Ou seja, ele poe tudo que tem só na tabela A, tudo que tem em comum entre A e B
e tudo que tem só na B também, preenchendo as colunas vazias com Null).

id | nome   | id | nome
1    ROBO     2    ROBO
2    Macaco   Null Null
3    Samurai  4    Samurai
Null Null     1    ESPADA

LEFT OUTER JOIN

Retorna um conjunto de todos os registros da TabelaA, e além disso, os registros
correspondentes ( quando disponíveis ) na tabelaB. Se não houver registros 
correspondentes ele simplesmente vai preencher com "null". ( ou seja ele poe tudo
que tem na A e tudo que tem em comum entre A e B mas nao poe o que só tem na B).

id | nome   | id | nome
1    ROBO     2    ROBO
2    Macaco   Null Null
3    Samurai  4    Samurai
4    Monitor  null null

Aula 18 - OUTER JOIN

Left outer JOIN ou Left Join

Como descobrir quais pessoas tem um cartão de crédito registrado

SELECT *
From Person.Person pp
Inner JoIN Sales.PersonCreditCard PC
ON pp.BusinessEntityID = pc.BusinessEntityID
-- com Inner Join tivemos um resultado com 19118 linhas podendo estar 
-- excluindo linhas.
-- Com o Left Join tivemos 19972 o que sigfnica que ele incluiu dados mesmo 
-- onde não estão presentes dados da segunda tabela que nesse caso era o person.creditcard

Ou seja, 854 pessoas que não tem cartão de crédito registrado.

para extrair os dados dessas pessoas que não tem cartão de crédito registrado,
devemos montar a seguinte Query:

SELECT *
From Person.Person pp
left JoIN Sales.PersonCreditCard PC
ON pp.BusinessEntityID = pc.BusinessEntityID
where pc.BusinesEntityID is Null

Aula 19 - Union

O operador Union combina dois ou mais resultados de um select em um resultado apenas.

Estrutura do UNION:

Select Coluna1, coluna2
FROM Tabela1
Union
Select Coluna1, Coluna2
From Tabela2

ou também Union ALL que permite que você junte as informações incluindo os dados duplicados

SELECT [ProductID], [name], [productNumber]
From Production.Product where name like '%Chain%'
Union
SELECT [ProductID], [name], [productNumber]
From Production.Product where name like '%Decal%'

320	Chainring Bolts	CB-2903
321	Chainring Nut	CN-6137
322	Chainring	    CR-7833
324	Chain Stays	    CS-2812
325	Decal 1	        DC-8732
326	Decal 2	        DC-9824
952	Chain	        CH-0234


Juntou ↓↓↓
952	Chain	        CH-0234
324	Chain Stays  	CS-2812
322	Chainring	    CR-7833
320	Chainring Bolts	CB-2903
321	Chainring Nut	CN-6137

Com ↓↓↓
325	Decal 1	DC-8732
326	Decal 2	DC-9824

----------------------------------

Para complementar podemos dar Order By name desc ou asc

SELECT [ProductID], [name], [productNumber]
From Production.Product where name like '%Chain%'
Union
SELECT [ProductID], [name], [productNumber]
From Production.Product where name like '%Decal%'
Order By name asc

952	Chain	        CH-0234
324	Chain Stays	    CS-2812
322	Chainring	    CR-7833
320	Chainring Bolts	CB-2903
321	Chainring Nut	CN-6137
325	Decal 1	        DC-8732
326	Decal 2	        DC-9824


Desafio:

Encontrar e juntar 2 tabelas do banco de dados. ( escolha livre ).

Select ProductID, Shelf, LocationID
from Production.ProductInventory
Where ProductID <= 100
Union
Select ProductID, Shelf, LocationID
from Production.ProductInventory
where Shelf = 'A'
order by Shelf asc

Aula 20 - Self Join

-- Select Nome_coluna
-- FROM TABELA A, Tabela B
-- Where Condição

-- Vamos selecionar todos os clientes que moram na mesma região

Select A.Contactname, A.Region, B.contactName,B.Region
From Customers A, Customers B
Where A.region = B.Region

-- Vamos encontrar o nome e a data de contratação de todos os funcionários 
-- que foram contratados no mesmo ano.

Select A.firstName, A.hireDate, B.firstname, b.hiredate
FROM Employees A, Employees B
Where Datepart(YEAR,A.hiredate) = DATEPART(Year,b.hiredate)

DESAFIO:

Na tabela detalhe do pedido [ order details ] quais produtos tem o mesmo percentual de desconto ?

R:
SELECT A.ProductID, A.discount, B.ProductID,B.discount
From [Order Details] A, [Order Details] B
where A.Discount = B.Discount

Aula 21 - Subquery ( subselect ) - Avançado

monte um relatório de todos os produtos cadastrados que tem o preço de venda acima da 
média.

Pra saber a média faria:

SELECT AVG(listprice)
FROM Production.Product

Guardaria o preço da média, e depois faria um segundo filtro dos que estão acimad a média:

SELECT *
FROM Production.Product
WHere ListPrice > 438.66

Uma forma mais dinamica de fazer isso é usar o subselect.

SELECT *
FROM Production.Product
where listprice > (SELECT AVG(listPrice) from Production.product)

--------------------------------------------------------------------------------

Gostaria de descobrir qual o nome dos meus funcionários que tem o cargo 'Design Engineer'

SELECT *
FROM person.Person

SELECT *
FROM HumanResources.Employee
where JobTitle = 'Design Engineer'

encontrar a coluna que tem essa informação e fazer o seguinte filtro

SELECT *
FROM person.Person
where BusinesEntityID in (5,6,15)


para ter uma pesquisa dinâmica ( sem dados fixos [5,6,15]) podemos fazer o subselect.

SELECT FirstName
FROM Person.Person
where BusinessEntityID in (
select BusinessEntityID from HumanResources.Employee 
where JobTitle = 'Design Engineer')

-- outra forma de fazer isso é com Inner Join:

Select P.Firstname
from Person.person P
Inner Join HumanResources.Employee E on P.BusinessEntityID = E.BusinessEntityID
and E.JobTitle = 'Design Engineer'

DESAFIO

Encotrar todos os endereços que estão no estado de 'Alberta', 

DICAS: usar a tabela Person.Adress e também Person.StateProvince
R:

Select *
FROM person.address

Select *
From person.StateProvince

Para checkar qual coluna existe em comum entre as tabelas e ai montar o seguinte Subquery ( subselect )

SELECT AddressLine1
FROM Person.Address
Where StateProvinceID in ( SELECT StateProvinceID 
FROM Person.StateProvince where name = 'alberta')

Aula 22 Datepart 

Biblioteca Datepart:

-- https://learn.microsoft.com/pt-br/sql/t-sql/functions/datepart-transact-sql?view=sql-server-ver16


Datepart é a Sintaxe para extrair (filtrar) uma informação de uma determinada coluna da tabela,
por exemplo na coluna OrderDate, temos o dia o mes e o ano -> 2011-05-31

Podemos usar um comando para extrair apenas o ano o dia ou o mês como no exemplo a baixo:
 
select SalesOrderID, DATEPART(month,OrderDate) as Mes
from Sales.SalesOrderHeader

que nos retornará  o SalesOrderID e o Mes 
SalesOrderID | Mes 
43659	        5
43660	        5
43661	        5
43662           5

Exemplo de uso:

SELECT Avg (TotalDue) as Media, Datepart (month, OrderDate) as Mes
From sales.SalesOrderheader
Group by datepart ( month, orderdate)
order By mes

DESAFIO

Extrair o mes e ano de uma tabela da sua escolha no banco de dados

Select ProductID, Datepart(month,DueDate) as Mes, Datepart(year,DueDate) as Ano
from Purchasing.PurchaseOrderDetail
order By ano, mes

Aula 23 - Manipulação de String

Biblioteca String - Funções de cadeia de caracteres ( lista de funções de string )

https://learn.microsoft.com/pt-br/sql/t-sql/functions/string-functions-transact-sql?view=sql-server-ver16

Um exemplo de aplicaçao é a juntação de duas colunas, "concatenar os dados" 

SELECT Concat (FirstName, ' ', lastName) as 'nome e sobrenome'
From Person.person
Syed Abbas
Catherine Abel
Kim Abercrombie
Kim Abercrombie

Já para trazer todos os dados de uma coluna em letra maiúscula ou minúscula usamos o manipulador de string Upper e Lower

SELECT Upper(Firstname), Lower(LastName)
From Person.person

Ou então para contar o número de caracteres podemos utilizar o KEN

SELECT Firstname, LEN(Firstname)
From Person.person

Substring:

Subquery utizado para extrair uma porção da informação contida no string da coluna filtrada.

por exemplo:

SELECT Firstname, SUBSTRING(FirstName, 1,3)
 From Person.person        (Coluna(FirstName),inicio(1 sigfnica primeira letra), numero de caracteres coletados(3 letrar))


Syed	    Sye
Catherine	Cat
Kim	        Kim
Kim	        Kim

Retornou as 3 primeiras letras da coluna FirstName.


REPLACE:

Serve para modificar um caractere dentro de uma string de uma coluna filtrada.

por exemplo, vamos substituir o traço por *

SELECT replace(ProductNumber, '-','*')
From Production.Product

Nos Retornou

AR*5381
BA*8327
BB*7421
BB*8107
BB*9108

ao invés de

AR-5381
BA-8327
BB-7421
BB-8107
BB-9108

DESAFIO:

Colocar em prática em qualquer tabela da sua escolha os conceitos de:

Concat:

Select Addressline1, PostalCode, Concat(AddressLine1, ' ', PostalCode) as 'Endereço e CEP'
From Person.Address

#500-75 O'Connor Street     |  	K4B 1S2 |	#500-75 O'Connor Street K4B 1S2
#9900 2700 Production Way	|   V5A 4X1	|   #9900 2700 Production Way V5A 4X1


-------------------------------------------------------------------------

LEN
Select len(passwordHash) as 'Password Size'
From Person.Password

44
44
44

-------------------------------------------------------------------------

Lower

Select Lower(firstname)
From Person.Person

syed
catherine
kim
kim
kim

-------------------------------------------------------------------------

Upper

Select Upper (rowguid)
From Person.Person

AAC965D2-6E72-441E-AE35-0004C710BD47
BA2745E9-2735-4A61-A717-000CE977B267
1972DBC5-A82F-4AD2-A992-000D06DD049C

-------------------------------------------------------------------------

Substring

Select LastName, SUBSTRING(lastname,4,3)
From Person.Person

Abbas	    as
Abel	    l
Abercrombie	rcr
Abercrombie	rcr

-------------------------------------------------------------------------

Replace

Select rowguid, replace(rowguid,'-','      ')
From Production.Product

    7A927632-99A4-4F24-ADCE-0062D2D113D9 |	7A927632      99A4      4F24      ADCE      0062D2D113D9
    94506C9D-5991-46A7-82EA-00E05D8D9B9C |	94506C9D      5991      46A7      82EA      00E05D8D9B9C
    CA74B54E-FC30-4464-8B83-019BFD1B2DBB |	CA74B54E      FC30      4464      8B83      019BFD1B2DBB
    89B6E84F-5C08-4CD9-B803-01F2CE24E417 |	89B6E84F      5C08      4CD9      B803      01F2CE24E417


-------------------------------------------------------------------------

Aula 24 - Operações Matemáticas

Funções matemáticas SQL Server.

Funções matemáticas entre colunas, por exemplo:

Select UnitPrice - Linetotal (subtração)
from Sales.SalesOrderdetail

Select UnitPrice + Linetotal (Soma)
from Sales.SalesOrderdetail

Select UnitPrice * Linetotal (multiplicação)
from Sales.SalesOrderdetail

Select UnitPrice / Linetotal (divisão)
from Sales.SalesOrderdetail

DESAFIO

Entrar em alguma planílha do banco de dados e utilizar a função ROUND.

Select listprice, ROUND(listprice,0)
from Production.ProductListPriceHistory

33,6442	34,00
33,6442	34,00
34,99	35,00

--------------------------------------------------------------------------------

Aula 25 - Tipos de dados

BOLEANOS
caracteres
NÚMEROS
TEMPORAIS

-- Boleanos

Por padrão ele é inicializado como nulo, e pode receber tanto 1 ou 0
BIT

-- Caracteres

 Tamanho Fixo - Char // permite inserir até uma quantidade fixa de caracteres 
e sempre ocupa todo o espaço reservado 10/50

Tamanhos variáveis - varchar ou nvarchar // permite inserir até uma quantidade que for definida, porém 
só usa o espaço que for preenchido 10/50

-- Números

Valores exatos: 
Tinyint  Não tem parte do valor fracionados, ( ex:> 1.43, 24.23) somente valores inteiros
Smallint - mesma coisa porém com um limite maior.
Int - Mesma coisa porém com limete maior.
Bigint - mesma coisa porém com um limite maior.
Numeric ou decimal - valores exatos, porém permite ter parte fracionados, que também pode ser especificado
a precisão e escala ( escala é o numero de digitos na parte fracional ) -  ex: Numeric (5,2) 113,44

-- Valores aproximados 

1. REAL - Tem precisão aproximada de até 15 digitos após a virgula.
2. FLOAT - mesmo conceito de REAL

-- Temporais

DATE - armazena data no formato AAAA/MM/DueDate
DATETIME - armazena data e horas no formato AAAA/mm/dd hh:mm:ss
DATETIME2 - Data e horas com adição de milissegundos no formato aaaa/mm/dd hh:mm:sssss
SMALLDATETIME - data e hora nos respeitando o limite entre '1900-01-01:00:00:00' até '2079-06-06:23:59:59'
TIME - Horas, minutos, segundos e milissegundos respeitando 
o limite de '00:00:00.0000000' to '23:59:59.9999999'
DATETIMEOFFSET - Permite armazenar informações de data e horas incluindo o fuso horário.

AULA 26 - CHAVES PRIMáRIAS e ESTRANGEIRAS -

- Uma chave primária é basicamente uma coluna ou grupo de colunas, usada para identificar
unicamente uma linha em tabela.
- você consegue criar essas chaves primárias através de restrições ( ou constraints em inglês), 
que são regras que você define quando está criando um índice único para aquela coluna
ou grupo de colunas.

Create Table Nome_Tabela ( 
    NomeColuna, tipodedados PRIMARY KEY
    NomeColuna, tipodedados ...
)

------------------------------------------------------------------------------------------------------------------

- Uma Chave estrangeira é uma coluna ougrupo de colunas em uma tabela que identifica unicamente
uma linha em outra tabela.

- ou seja, uma chave estrangeira é definida em uma tabela onde ela é apenas uma referência e não contém todos os dados ali

- Então uma chave estrangeira é simplesmente uma coluna ou grupo de colunas que é uma chave primária em outra tabela.

- A tabela que contem a chave estrageira é chamada de tavela referênciadora ou tabela filho. E a tabela na qual a chave 
estrangeira é referenciada é chamada de tabela referenciada ou tabela pai.

- Uma tabela pode ter mais de uma chave estrangeira dependendo do seu relacionamento com as outras tabelas.

-----------------------------------------------------------------------------------------------------------------------

- No SQL server você define uma chave estrangeira atravez de um "Foreign Key Constraint" ou restrição de chave estrangeira.

- Uma restrição de chave estrangeira indica que os valores em uma coluna ou grupo de colunas na tabela filho correspondem 
aos valores na tabela pai.

- Nós podemos entender que uma chave estrangeira mantém a "integridade referencial ".

-- Desafio 

encontrar todos os exemplos de Foreign Key e Primary Key no banco de dados.

Feito !


















