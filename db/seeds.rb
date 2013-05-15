require 'faker'
cats = ['Apts / Housing', 'For Sale', 'Jobs', 'Personals', "Volunteer"]
cats.each do |category|
  current_category = Category.create(name: category)
  # 3.times do 
  #   post = current_category.posts.build(:title => Faker::Lorem.words(num = 2).join(" "), :body => Faker::Lorem.sentences(sentence_count = 4).join(" "))
  #   post.save
  # end
end


