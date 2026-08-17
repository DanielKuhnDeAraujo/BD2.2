-- 1)
alter VIEW Vw_FilmesDisponiveis
as
select * from FILME where status = 'disponivel';

go
select * from Vw_FilmesDisponiveis

-- 2)
go
alter view Vw_FilmesMaisAlugados
as
select f.FILME , count(f.FILME) as Vezes_alugado from LOCACOES as l inner join filme as f on f.COD_FILME = l.COD_FILME group by f.FILME

go 
select * from Vw_FilmesMaisAlugados order by Vezes_alugado desc

-- 3)
go
alter FUNCTION AumentaCento(@preco int)
RETURNS @tbl TABLE(pAtua int )
AS
BEGIN
    INSERT INTO @tbl(pAtua) VALUES ((@preco * 1.1))
    RETURN
END

select * from AumentaCento(100);
go

-- 4)
CREATE FUNCTION Maior(@val1 int,@val2 int)
RETURNS @tbl TABLE(mai int )
AS
BEGIN
    If (@val1 > @val2)
    begin
        insert into @tbl values (@val1);
        RETURN
    end;
    insert into @tbl values (@val2);
    RETURN 
END
select * from Maior(200,100)
go

-- 5)
alter FUNCTION MaiorDeIdade(@data date)
RETURNS @tbl TABLE(resp char(50))
AS
BEGIN
    If ((dateadd(year,18,@data)) < GETDATE())
    begin
        insert into @tbl values ('Maior de idade');
        RETURN
    end;
    insert into @tbl values ('Menor de idade');
    RETURN
END

