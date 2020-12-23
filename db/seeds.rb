user1 = User.create!(name: '信長', email: 'nobunaga@example.com', password: 'foobar123', password_confirmation: 'foobar123')
user2 = User.create!(name: '秀吉', email: 'hideyoshi@example.com', password: 'foobar123', password_confirmation: 'foobar123')
10.times do |n|
  Post.create(user_id: user1.id, content: "test#{n+1}")
  Post.create(user_id: user2.id, content: "test#{n+1}")
end