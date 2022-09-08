email_test = "test@example.com"
password_test = "password"

ActiveRecord::Base.connection.execute("TRUNCATE TABLE users RESTART IDENTITY CASCADE")
ActiveRecord::Base.connection.execute("TRUNCATE TABLE posts RESTART IDENTITY CASCADE")

user1 = User.create!(email: "satou@example.com", password: "password")
user2 = User.create!(email: "suzuki@example.com", password: "password")
user3 = User.create!(email: "tanaka@example.com", password: "password")

user2.posts.create!(content: "沖縄そば")
user1.posts.create!(content: "海ぶどう")
user3.posts.create!(content: "ゴーヤチャンプル")
user3.posts.create!(content: "サーターアンダギー")
user1.posts.create!(content: "タコライス")

# ログイン時のテストユーザー
User.create!(email: email_test, password: password_test)

puts "初期データの投入に成功しました！"
