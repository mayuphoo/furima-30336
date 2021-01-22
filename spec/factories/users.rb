FactoryBot.define do
  factory :user do
    gimei = Gimei.name
      nickname              {Faker::Internet.user_name }
      email                 {Faker::Internet.free_email}
      password              {"abcd123"}
      password_confirmation {password}
      last_name             {gimei.last.kanji}
      first_name            {gimei.first.kanji}
      last_kana             {gimei.last.katakana}
      first_kana            {gimei.first.katakana}
      birthday              {"1997/12/26"}
  end
end