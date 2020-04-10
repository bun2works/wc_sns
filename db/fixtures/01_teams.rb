Faker::Config.locale = :ja

unless Rails.env.production?
  # 50件のデータを用意する
  TEAM_MAX = 50
  team_attrs = Proc.new do
    Array.new(TEAM_MAX) do |idx|
      { id: idx + 1,
        # Fakerを使ってデータを用意
        email: Faker::Internet.email,
        name: Faker::Name.name + 'VC',
        representative: Faker::Name.name,
        homepage: Faker::Lorem.paragraph,
        location_and_day: Faker::Lorem.paragraph,
        introduction: Faker::Lorem.paragraph,
        password: 'password',
        password_confirmation: 'password'
      }
    end
  end

  # 配列を一度に登録する(一度だけ)
  Team.seed_once(:id, *team_attrs.call)

end