FactoryBot.define do
  factory :user do
    nickname              {'t'}
    email                 {'t@t'}
    password              {'000000o'}
    password_confirmation {password}
    firstname_kanji       {'太郎'}
    lastname_kanji        {'山田'}
    firstname_katakana    {'タロウ'}
    lastname_katakana     {'ヤマダ'}
    birth_day             {'1997-08-09'}
  
  end
end