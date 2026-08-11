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
