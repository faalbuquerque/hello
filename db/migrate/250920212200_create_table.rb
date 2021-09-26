require 'pg'

#cria a tabela(query)
sql = "CREATE TABLE games (
        id SERIAL PRIMARY KEY,
        name varchar(40) NOT NULL,
        genre varchar(40) NOT NULL,
        created_at date NOT NULL,
        updated_at date NOT NULL
      );"

begin
  #conexcao com o banco
  conection = PG.connect(dbname: 'hello_development', host: 'db',
                         user: 'postgres', password: 'postgres')

  conection.exec(sql)

rescue PG::Error => e
  puts e.message
ensure
  conection.close if conection
end