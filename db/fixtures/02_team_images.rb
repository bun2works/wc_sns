TEAM_IMAGE_COUNT = 4

# 追加したレコードに画像を追加
Team.all.each do |team|
  unless team.team_image.attached?
    team.team_image.attach(io: File.open("db/fixtures/images/team/#{Random.rand(1..TEAM_IMAGE_COUNT)}.jpg"), filename: "#{Random.rand(1..TEAM_IMAGE_COUNT)}.jpg")
  end
end