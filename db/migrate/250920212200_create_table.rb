require 'pg'

#cria a tabela(query)
sql = "CREATE TABLE users (
        id SERIAL PRIMARY KEY,
        name varchar(200) NOT NULL,
        email varchar(200) NOT NULL,
        created_at date NOT NULL,
        updated_at date NOT NULL
      );"

begin
  #conexcao com o banco
  conection = PG.connect(dbname: 'frankcalendar_development', host: 'db',
                         user: 'postgres', password: 'postgres')

  conection.exec(sql)

rescue PG::Error => e
  puts e.message
ensure
  conection.close if conection
end