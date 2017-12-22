namespace :generete do
  desc "Populate the database with faker data."
  task data: :environment do
    
    # Register 10 schools with address.
    10.times do
      School.create!(
      name: Faker::Name.name,
      cnpj: Faker::Number.number(14),
      )
    end
    
    # Register 10 addresses.
    School.all.each do |school|
      Address.create!(
      street: Faker::Address.street_name,
      neighborhood: Faker::Address.community,
      city: Faker::Address.city,
      number: Faker::Address.building_number,
      school: school
      )
    end
    
    # Register 10 students in each registered school.
    School.all.each do |school|
      10.times do
        Student.create!(
        name: Faker::Name.name,
        cpf: Faker::Number.number(11),
        school_id: school.id
        )
      end
    end
    
    # Register 30 teachers, 3 for each school.
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
