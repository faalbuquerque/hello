require 'pg'

sql = "INSERT INTO games(id, name, email, created_at, updated_at)
       VALUES ('Maria', 'maria@frankcalendar.com',
       '#{DateTime.now.to_datetime}',
       '#{DateTime.now.to_datetime}'
       );"

puts '====== Running seeds ======'
begin
  conection = PG.connect(dbname: 'frankcalendar_development', host: 'db',
                         user: 'postgres', password: 'postgres')
  conection.exec(sql)

  puts '====== Seeds concluded ======'
rescue => exception
  puts e.message
  puts '====== Error ======'
ensure
  conection.close if conection
end