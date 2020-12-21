10.times do |n|
  Post.create(user_id: 1, content: "test#{n}")
  Post.create(user_id: 2, content: "test#{n}")
end