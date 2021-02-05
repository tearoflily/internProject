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
    name_kana: "ジュウギョウイン#{i +1}",
    tellnumber: "080-0000-0008",
    email: "mail#{i}@example.com",
    employee: true,
    password: 'password',
    password_confirmation: 'password'
  )
end
  12.times do |i|
    User.create!(
      name: "顧客#{i}",
      name_kana: "ｺｷｬｸ#{i + 1}",
      tellnumber: "080-1000-0009",
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
      process: 'sasimi',
      num: 5,
      order_date: Date.today + 1,
      order_time: Time.local(
        Time.now.year,
        Time.now.month,
        Time.now.day,
        Time.now.hour + 1,
        30,0),
      user_id: 5
    )
 end
 4.times do |i| 
  Order.create(
    name: 'さんま',
    price: 100,
    process: 'kirimi',
    num: 5,
    order_date: Date.today+1,
    order_time: Time.local(
      Time.now.year,
      Time.now.month,
      Time.now.day,
      Time.now.hour + i,
      30,0),
    user_id: 5
  )
 end
 4.times do |i| 
  Order.create(
    name: 'さんま',
    price: 100,
    process: 'sioyaki',
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
      process: 'sasimi',
      num: 5,
      order_date: Date.today.beginning_of_month.prev_month + i,
      order_time: Time.local(
        Time.now.year,
        Time.now.month,
        Time.now.day,
        Time.now.hour + 1,
        30,0),
      user_id: 6
    )
  end
  8.times do |i|
    Order.create(
      name: 'さんま',
      price: 100,
      process: 'kirimi',
      num: 5,
      status: 'delivery',
      order_date: Date.today.beginning_of_month.prev_month + i,
      order_time: Time.local(
        Time.now.year,
        Time.now.month,
        Time.now.day,
        Time.now.hour + 1,
        30,0),
      user_id: 6
    )
  end
  8.times do |i|
    Order.create(
      name: 'さんま',
      price: 100,
      process: 'sioyaki',
      num: 5,
      status: 'delivery',
      order_date: Date.today + i,
      order_time: Time.local(
        Time.now.year,
        Time.now.month,
        Time.now.day ,
        Time.now.hour + 1,
        30,0),
      user_id: 6
    )
  end
  8.times do |i|
    Order.create(
      name: 'さんま',
      price: 100,
      process: 'sasimi',
      num: 5,
      status: 'delivery',
      order_date: Date.today + i,
      order_time: Time.local(
        Time.now.year,
        Time.now.month,
        Time.now.day ,
        Time.now.hour + 1,
        30,0),
      user_id: 6
    )
  end