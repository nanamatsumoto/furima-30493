FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"nnn@gmail.com"}
    password              {"nnnn11"}
    password_confirmation {"nnnn11"}
    last_name             {"阿部"}
    first_name            {"智子"}
    last_name_kana        {"アベ"}
    first_name_kana       {"トモコ"}
    birth_date            {"1993-03-07"}
  end
end