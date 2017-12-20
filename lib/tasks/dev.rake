namespace :dev do
  desc "Recria o banco de dados e o popula com dados faker."
  task setup: :environment do
    
    puts "Apagando o banco de dados..."
    %x(rails db:drop)
    puts "Apagando o banco de dados... [SUCESSO]"

    puts "Criando o banco de dados..."
    %x(rails db:create)
    puts "Criando o banco de dados... [SUCESSO]"

    puts "Criando as tabelas do banco de dados..."
    %x(rails db:migrate)
    puts "Criando as tabelas do banco de dados... [SUCESSO]"
    
    puts "Populando o banco de dados..."
    %x(rails generete:data)
    puts "Populando o banco de dados... [SUCESSO]"
    
  end
end
