Setting.create(key: 'Api Token', value: SecureRandom.hex(20))
Setting.create(key: 'QR Code Size', value: '200x200')

3.times do |index|
  Company.create(
    name: "company_#{index}",
    address: "address_#{index}",
    postcode: "postcode_#{index}",
    city: "city_#{index}",
    country: "country_#{index}",
    email: "info_#{index}@gs-software.pl",
    created_at: rand(100).days.ago
  )
end

6.times do |index|
  company = Company.all.to_a.sample

  User.create(
    first_name: "first_#{index}",
    last_name: "last_#{index}",
    email: "admin#{index}@gs.com",
    password: '1234567890',
    password_confirmation: '1234567890',
    role: 'admin',
    company_id: company.id,
    created_at: rand(100).days.ago
  )
end

Company.all.each_with_index do |company, i|
  5.times do |index|
    Client.create(
      code: "code_#{index}",
      name: "client_#{index}",
      address: "address_#{index}",
      postcode: "postcode_#{index}",
      city: "city_#{index}",
      country: "country_#{index}",
      company_id: company.id,
      created_at: rand(100).days.ago
    )
  end

  3.times do |j|
    Driver.create(
      first_name: "first_#{i}_#{j}",
      last_name: "last_#{i}_#{j}",
      client_id: company.clients.sample.id,
      company_id: company.id,
      created_at: rand(100).days.ago
    )
  end
end

15.times do |index|
  company = Company.all.to_a.sample
  client = company.clients.to_a.sample

  User.create(
    first_name: "first_#{index}",
    last_name: "last_#{index}",
    email: "user#{index}@gs.com",
    password: '1234567890',
    password_confirmation: '1234567890',
    role: 'user',
    client_id: client.id,
    company_id: company.id,
    created_at: rand(100).days.ago
  )
end

10.times do |index|
  company = Company.all.to_a.sample

  Product.create(
    code: "code_#{index}",
    name: "name_#{index}",
    company_id: company.id,
    created_at: rand(100).days.ago
  )
end

50.times do |index|
  company = Company.all.to_a.sample
  client = company.clients.sample
  product = company.products.sample
  user = (company.users.users + company.users.admins + company.users.super_admins).sample
  driver = company.drivers.sample

  Notify.create(
    car_number: "car_no_#{index}",
    trailer_number: "trailer_no_#{index}",
    expiration_from: rand(1000).minutes.ago,
    expiration_to: rand(1000).minutes.from_now,
    hidden: false,
    hidden_at: nil,
    client_id: client.id,
    product_id: product.id,
    driver_id: driver.id,
    user_id: user.id,
    company_id: company.id,
    created_at: rand(100).days.ago
  )
end
