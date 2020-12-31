crumb :root do
  link "投稿一覧", root_path
end

crumb :post do |post|
  link "#{post.user.name}さんの投稿(#{post.id})", post_path(post)
end
