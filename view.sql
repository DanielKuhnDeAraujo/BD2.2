-- Cruiando a teibou

create table Produtos (
	id int identity(1,1) primary key,
	nome char(50),
	fabricante char(50),
	qtd int,
	vUni int,
	tipo char(50)
);

insert into Produtos  values ('Caixa de RTX5060','Seu José Embalagens',6000,700,'Caixa'), 
('Perna de Barbie','Criança que arranca parte das bonecas',11,1000,'Prótese Altamente Tecnológica Minificada');
-- Criando a view
GO
CREATE VIEW vwProdutos AS
SELECT id AS Código,
       Nome AS Produto,
       Fabricante,
       qtd,
       vUni AS [ValorUnitario],
       Tipo
FROM Produtos

--Teste
GO
select * from vwProdutos;


--  Alter View
Go
ALTER VIEW vwProdutos AS
SELECT id AS Código,
       Nome AS Produto,
       Fabricante,
       qtd AS [Quantidade],
       vUni AS [ValorUnitario],
       Tipo
FROM Produtos
WHERE vUni > 499.00