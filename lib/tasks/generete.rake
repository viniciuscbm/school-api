namespace :generete do
  desc "Popula o banco de dados com dados faker."
  task data: :environment do
    
    # Cadastra 10 endereços.
    10.times do
      Address.create!(
      street: Faker::Address.street_name,
      neighborhood: Faker::Address.community,
      city: Faker::Address.city,
      number: Faker::Address.building_number,
      )
    end
    
    # Cadastra 10 escolas com endereço.
    Address.all.each do |address|
      School.create!(
      name: Faker::Name.name,
      cnpj: Faker::Number.number(14),
      address: address 
      )
    end
    
    # Cadastra 10 estudantes em cada escola registada.
    School.all.each do |school|
      10.times do
        Student.create!(
        name: Faker::Name.name,
        cpf: Faker::Number.number(11),
        school_id: school.id
        )
      end
    end
    
    # Cadastra 30 professores, 3 para cada escolas.
    School.all.each do |school|
      3.times do
        school.teachers.create!(attributes = { 
        name: Faker::Name.name,
        instruct: Faker::Educator.course
      })
    end
  end
  
end
end
