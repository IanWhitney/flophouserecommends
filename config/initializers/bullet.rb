begin
  Bullet.add_safelist type: :unused_eager_loading, class_name: "Movie", association: :recommendations
rescue NameError
  nil
end
