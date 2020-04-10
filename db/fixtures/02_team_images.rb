IMAGE_COUNT = 4

# 追加したレコードに画像を追加
Team.all.each do |team|
  unless team.image.attached?
    team.image.attach(io: File.open("db/fixtures/images/team/#{Random.rand(1..IMAGE_COUNT)}.jpg"), filename: "#{Random.rand(1..IMAGE_COUNT)}.jpg")
  end
end