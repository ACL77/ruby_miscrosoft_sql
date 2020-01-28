
if OBJECT_ID('dbo.players', 'U') IS NOT NULL 
  drop table dbo.players; 

create table players
   (id 			integer IDENTITY(1,1),
   	name 		varchar(80)	not null,
    position 	varchar(80)	not null,
    club 		varchar(80)	not null,
    constraint pk_players primary key(id));