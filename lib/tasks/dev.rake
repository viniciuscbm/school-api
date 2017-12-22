namespace :dev do
  desc "Recreate the database and the population with faker data."
  task setup: :environment do
    
    puts "Deleting the database..."
    %x(rails db:drop)
    puts "Deleting the database... [SUCESSO]"

    puts "Creating the database..."
    %x(rails db:create)
    puts "Creating the database... [SUCESSO]"

    puts "Creating the database tables..."
    %x(rails db:migrate)
    puts "Creating the database tables... [SUCESSO]"
    
    puts "Populating the database..."
    %x(rails generete:data)
    puts "Populating the database... [SUCESSO]"
    
  end
end
