create table Pessoa (
  nome varchar(20) NOT NULL,
  id int primary key auto_increment
);

create table Servico (
	titulo varchar(20) NOT NULL,
  	id_servico int Primary key auto_increment,
  	preco int,
  	id_Pessoa int,
  	foreign key (id_Pessoa) references Pessoa(id)
);

insert into Pessoa(nome) values ('ana'),('maria'),('Pietro'),('Marcos'),('Joao');
insert into Servico(titulo,preco,id_Pessoa) values ('NAda',12,1),('NAda',190,1),('Nda',12,3),('NAda',192,2),('NAda',152,1),('NAda',150,1),('Nda',122,3),('NAda',1952,2);

/* consultas 1 */

select nome,SUM(preco) as Total from Pessoa join Servico on Pessoa.id = Servico.id_Pessoa Group by Pessoa.nome having Total >200;

/* consultas 2 */

select nome,SUM(preco) as Total from Pessoa left join Servico on Pessoa.id = Servico.id_Pessoa group by Pessoa.nome;

/*consulta 3 - quantidade de serviços que cada pessoa */

select nome,count(Servico.preco) as QuantidadeDeServico from Pessoa join Servico on Pessoa.id = Servico.id_Pessoa Group by Pessoa.nome;

/* consulta 4 - quantidade de serviços que cada pessoa,incluindo nulos ordenado pelos nomes em ordem ascendente*/

select nome,count(Servico.preco) as QuantidadeTotalDeServico from Pessoa left join Servico on Pessoa.id = Servico.id_pessoa group by Pessoa.nome order by Pessoa.nome ASC ;


/* consulta 5 - os 2 maiores prestadores de serviço,usando o limit para limitar a quantidade de linhas que aparecem*/

select nome,count(Servico.preco) as QuantidadeTotalDeServico from Pessoa left join Servico on Pessoa.id = Servico.id_pessoa group by Pessoa.nome order by count(Servico.preco) desc limit 2 ;
/*consulta 6- ordenado pela media aritmetica em ordem descendente,pessoas que nunca prestaram nenhum serviço tem 0 ao inves de NULL.  */

select nome,coalesce(avg(Servico.preco),0) as Media from Pessoa left join Servico on Pessoa.id= Servico.id_Pessoa group by Pessoa.nome order by avg(Servico.preco) desc
