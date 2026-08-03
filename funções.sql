CREATE FUNCTION AumentaCento(@preco int)
RETURNS @tbl TABLE(pAtua int )
AS
BEGIN
    INSERT INTO @tbl(pAtua) VALUES ((@preco * 1.1))
    RETURN
END


go
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

go
CREATE FUNCTION MaiorDeIdade(@data datetime)
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

go