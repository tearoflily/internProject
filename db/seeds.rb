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
      order_date_details: DateTime.now + 1,
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
    order_date_details: DateTime.now + 1,
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
    order_date_details: DateTime.now + 1,
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
      order_date_details: DateTime.now.beginning_of_month.prev_month + i,
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
      order_date_details: DateTime.now.beginning_of_month.prev_month + i,
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
      order_date_details: DateTime.now + i,
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
      order_date_details: DateTime.now + i,
      order_time: Time.local(
        Time.now.year,
        Time.now.month,
        Time.now.day ,
        Time.now.hour + 1,
        30,0),
      user_id: 6
    )

  name_sugi = [
    'たい',
    'ふぐ',
    'あゆ',
    'いか',
    'たこ',
    'ひらめ',
    'ぶり'
  ]
  category_sugi = [
    'white',
    'white',
    'white',
    'octopassquid',
    'octopassquid',
    'white',
    'bigger'
  ]
  info_sugi = [
    '新鮮で身が引き締まったタイです',
    '食べ応えがあるフグです',
    '子供も美味しく食べられるアユです',
    'どんな調理方法でも美味しいイカです',
    '柔らかく食べやすいタコです',
    '採れたて新鮮なヒラメです',
    '旬の脂がのったブリです'
  ]
  name_sugi.zip(category_sugi, info_sugi).each do |item, category, info|
    Item.create!(
      name: item,
      category: category,
      info: info
    )
  end
  # 画像は手動で登録します

  process_sugi = %w(
    sasimi
    kirimi
    nimono
    sioyaki
    flay
  )
  process_sugi.each do |process|
    Product.create!(
      name: 'たい',
      price: 220,
      process: process,
      seles_date: Date.today + 1,
      stock: 25
    )
  end
  process_sugi.each do |process|
    Product.create!(
      name: 'ふぐ',
      price: 250,
      process: process,
      seles_date: Date.today + 1,
      stock: 30
    )
  end
  process_sugi.each do |process|
    Product.create!(
      name: 'あゆ',
      price: 200,
      process: process,
      seles_date: Date.today + 1,
      stock: 30
    )
  end
  process_sugi.each do |process|
    Product.create!(
      name: 'いか',
      price: 180,
      process: process,
      seles_date: Date.today + 1,
      stock: 30
    )
  end
  process_sugi.each do |process|
    Product.create!(
      name: 'たこ',
      price: 230,
      process: process,
      seles_date: Date.today + 1,
      stock: 30
    )
  end
  process_sugi.each do |process|
    Product.create!(
      name: 'ひらめ',
      price: 240,
      process: process,
      seles_date: Date.today + 1,
      stock: 30
    )
  end
  process_sugi.each do |process|
    Product.create!(
      name: 'ぶり',
      price: 210,
      process: process,
      seles_date: Date.today + 1,
      stock: 30
    )
  end

  [
    ['ひらめ', 240, 'sasimi', 2, 2, '2021-02-25', '2021-02-25 14:30:00', '2021-02-26 13:30:00', 5],
    ['ぶり', 210, 'sasimi', 4, 2, '2021-02-25', '2021-02-25 14:30:00', '2021-02-26 13:30:00', 6],
    ['ひらめ', 240, 'flay', 2, 2, '2021-02-25', '2021-02-25 14:30:00', '2021-02-26 13:30:00', 6],
    ['たい', 220, 'sasimi', 6, 2, '2021-02-20', '2021-02-20 14:30:00','2021-02-21 13:30:00', 5],
    ['ひらめ', 240, 'sioyaki', 2, 2, '2021-02-25', '2021-02-25 14:30:00', '2021-02-26 13:30:00', 5],
    ['ぶり', 210, 'sioyaki', 4, 2, '2021-02-25', '2021-02-25 14:30:00', '2021-02-26 13:30:00', 6],
    ['ひらめ', 240, 'sioyaki', 2, 2, '2021-02-25', '2021-02-25 14:30:00', '2021-02-26 13:30:00', 6],
    ['たい', 220, 'sioyaki', 6, 2, '2021-02-20', '2021-02-20 14:30:00','2021-02-21 13:30:00', 5],
    ['ふぐ', 250, 'nimono', 2, 2, '2021-02-20', '2021-02-20 14:30:00', '2021-02-21 13:30:00', 5],
    ['ふぐ', 250, 'nimono', 4, 2, '2021-02-20', '2021-02-20 14:30:00', '2021-02-21 13:30:00', 5],
    ['いか', 180, 'nimono', 3, 2, '2021-02-20', '2021-02-20 14:30:00', '2021-02-21 13:30:00', 6],
    ['たこ', 230, 'nimono', 2, 2, '2021-02-20', '2021-02-20 14:30:00', '2021-02-21 13:30:00', 6],
    ['ふぐ', 250, 'flay', 2, 2, '2021-02-20', '2021-02-20 14:30:00', '2021-02-21 13:30:00', 5],
    ['ふぐ', 250, 'sasimi', 4, 2, '2021-02-20', '2021-02-20 14:30:00', '2021-02-21 13:30:00', 5],
    ['いか', 180, 'sasimi', 3, 2, '2021-02-20', '2021-02-20 14:30:00', '2021-02-21 13:30:00', 6],
    ['たこ', 230, 'flay', 2, 2, '2021-02-20', '2021-02-20 14:30:00', '2021-02-21 13:30:00', 6],
    ['あゆ', 200, 'kirimi', 2, 2, '2021-02-20', '2021-02-20 14:30:00', '2021-02-21 13:30:00', 6],
    ['たこ', 230, 'sasimi', 6, 2, '2021-02-23', '2021-02-23 14:40:00', '2021-02-24 14:40:00', 5],
    ['あゆ', 330, 'flay', 2, 2, '2021-02-23', '2021-02-23 14:40:00', '2021-02-24 14:40:00', 5],
    ['たい', 220, 'sasimi', 3, 2, '2021-02-23', '2021-02-23 14:40:00', '2021-02-24 14:40:00', 6],
    ['ふぐ', 250, 'flay', 2, 2, '2021-02-23', '2021-02-23 14:40:00', '2021-02-24 14:40:00', 6],
    ['ぶり', 210, 'flay', 4, 2, '2021-02-25', '2021-02-25 13:30:00', '2021-02-26 13:30:00', 5],
    ['たこ', 230, 'sasimi', 6, 3, '2021-02-23', '2021-02-23 14:40:00', '2021-02-24 14:40:00', 5],
    ['あゆ', 200, 'flay', 2, 3, '2021-02-23', '2021-02-23 14:40:00', '2021-02-24 14:40:00', 5],
    ['たい', 220, 'sasimi', 3, 3, '2021-02-23', '2021-02-23 10:30:00', '2021-02-24 10:30:00', 6],
    ['ふぐ', 250, 'flay', 2, 3, '2021-02-23', '2021-02-23 10:30:00', '2021-02-24 10:30:00', 6],
    ['ひらめ', 240, 'sasimi', 2, 3, '2021-02-25', '2021-02-25 13:30:00', '2021-02-26 13:30:00', 5],
    ['ぶり', 210, 'sasimi', 4, 3, '2021-02-25', '2021-02-25 13:30:00', '2021-02-26 13:30:00', 5],
    ['たい', 220, 'sioyaki', 3, 3, '2021-02-23', '2021-02-23 10:30:00', '2021-02-24 10:30:00', 6],
    ['ふぐ', 250, 'sioyaki', 2, 3, '2021-02-23', '2021-02-23 10:30:00', '2021-02-24 10:30:00', 6],
    ['ひらめ', 240, 'sioyaki', 2, 3, '2021-02-25', '2021-02-25 13:30:00', '2021-02-26 13:30:00', 5],
    ['ぶり', 210, 'sioyaki', 4, 3, '2021-02-25', '2021-02-25 13:30:00', '2021-02-26 13:30:00', 5],
    ['ふぐ', 250, 'nimono', 2, 3, '2021-02-20', '2021-02-20 13:30:00', '2021-02-21 13:30:00', 5],
    ['ふぐ', 250, 'nimono', 4, 3, '2021-02-20', '2021-02-20 13:30:00', '2021-02-21 13:30:00', 5],
    ['いか', 220, 'nimono', 3, 3, '2021-02-20', '2021-02-20 13:30:00', '2021-02-21 13:30:00', 6],
    ['たこ', 230, 'nimono', 2, 3, '2021-02-20', '2021-02-20 13:30:00', '2021-02-21 13:30:00', 6],
    ['ひらめ', 240, 'flay', 2, 3, '2021-02-25', '2021-02-25 13:30:00', '2021-02-26 13:30:00', 5],
    ['たい', 220, 'sasimi', 6, 3, '2021-02-20', '2021-02-20 13:30:00', '2021-02-21 13:30:00', 5],
    ['ふぐ', 250, 'flay', 2, 3, '2021-02-20', '2021-02-20 13:30:00', '2021-02-21 13:30:00', 5],
    ['ふぐ', 250, 'sasimi', 4, 3, '2021-02-20', '2021-02-20 13:30:00', '2021-02-21 13:30:00', 5],
    ['いか', 220, 'sasimi', 3, 3, '2021-02-20', '2021-02-20 13:30:00', '2021-02-21 13:30:00', 6],
    ['たこ', 230, 'flay', 2, 3, '2021-02-20', '2021-02-20 13:30:00', '2021-02-21 13:30:00', 6],
    ['あゆ', 200, 'kirimi', 2, 3, '2021-02-20', '2021-02-20 13:30:00', '2021-02-21 13:30:00', 6],
    ['ぶり', 210, 'flay', 4, 3, '2021-02-25', '2021-02-25 13:30:00', '2021-02-26 13:30:00', 5]
  ].each do |name, price, process, num, status, order_date, order_date_detail, order_time, user_id|
    Order.create!(
      {
        name: name,
        price: price,
        process: process,
        num: num,
        status: status,
        order_date: order_date,
        order_date_details: order_date_detail,
        order_time: order_time,
        user_id: user_id
      }
    )
  end
   
    

  end