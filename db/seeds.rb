# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

4.times do |i|
  User.create!(
    name: "従業員#{i + 1}",
    name_kana: "ジュウギョウイン#{i}",
    tellnumber: "080-0000-000#{i}",
    email: "mail#{i}@example.com",
    employee: true,
    password: 'password',
    password_confirmation: 'password'
  )
end
  12.times do |i|
    User.create!(
      name: "ｺｷｬｸ#{i + 1}",
      name_kana: "顧客#{i}",
      tellnumber: "080-1000-000#{i}",
      email: "mails#{i}@example.com",
      employee: false,
      password: 'password',
      password_confirmation: 'password'
    )
  end
  8.times do |i| 
    Order.create(
      name: 'さんま',
      price: 100,
      process: '刺し身',
      num: 5,
      order_date: Date.today + 1,
      order_time: Time.local(
        Time.now.year,
        Time.now.month,
        Time.now.day,
        Time.now.hour + i,
        30,0),
      user_id: 5
    )
 end
  8.times do |i|
    Order.create(
      name: 'さんま',
      price: 100,
      process: '刺し身',
      num: 5,
      order_date: Date.today,
      order_time: Time.local(
        Time.now.year,
        Time.now.month,
        Time.now.day,
        Time.now.hour + i,
        30,0),
      user_id: 6
    )
  end