use LivFlow

-- View Livro simples
create view vw_Livro as
	select 
		Livro.codigo as codigo,
		Livro.titulo as titulo,
		Livro.ano as ano,
		Livro.edicao as edicao,
		Editora.nome as editora,
		ImagemCapa.origem as imagem,
		(select avg(Avaliacao.nota) from Avaliacao) as nota
	from Livro
	join Editora on Livro.editora = Editora.codigo
	join ImagemCapa on Livro.codigo = ImagemCapa.livro
--select * from vw_Livro

-- View Anuncio Simples
create view vw_Anuncio as
	select
		Anuncio.codigo as codigo,
		Usuario.nome + ' ' + Usuario.sobrenome as usuaio,
		Livro.titulo as livro,
		Imagem.origem as imagem,
		Anuncio.titulo,
		Anuncio.descricao,
		Anuncio.precoUnitario,
		Anuncio.quantidade,
		Anuncio.status,
		Anuncio.criado_em
	from Anuncio
	join Usuario on Anuncio.usuario = Usuario.codigo
	Join Livro on Anuncio.livro	= Livro.codigo
	join Imagem on Anuncio.imagem = Imagem.codigo
-- select * from vw_Anuncio


select * from AutorLivro
select * from Autor
select * from GeneroLivro
select * from Genero
select * from Editora
select * from ImagemCapa
select * from Livro
select * from Usuario
select * from Imagem
select * from Anuncio
join Editora on Livro.editora = Editora.codigo
join ImagemCapa on Livro.codigo = ImagemCapa.livro


--join AutorLivro on Livro.codigo = AutorLivro.livro
--join Autor on AutorLivro.autor = Autor.codigo
--join GeneroLivro on Livro.codigo = GeneroLivro.livro
--join Genero on GeneroLivro.genero = Genero.codigo