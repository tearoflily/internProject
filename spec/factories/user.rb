FactoryBot.define do
    factory :user do
      name { "太郎" }
      name_kana{ "タロウ" }
      tellnumber{ '090-2222-2222' }
      email{ 'taro@example.com' }
      password{ 'password' }
      password_confirmation{ 'password' }
    end
end