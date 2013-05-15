require 'securerandom'

get '/' do
  # Look in app/views/index.erb
  @categories = Category.all
  erb :index
end

post '/' do
  category = Category.where('name = ?', params[:post_category])
  category_id = category.first.id
  edit_key = SecureRandom.hex(10)
  new_post = Post.create(:title => params[:post_title],
                         :body => params[:post_body], 
                         :category_id => category_id,
                         :edit_key => edit_key)
  edit_url = "/category/posts/#{new_post.id}/#{edit_key}"
end

get '/category/:cat_id' do
  @posts = Post.where('category_id = ?', params[:cat_id])
  erb :category
end

get '/category/posts/:post_id' do
  @post = Post.find(params[:post_id])
  erb :post
end

get '/category/posts/:post_id/:edit_key' do
  @post = Post.find(params[:post_id])
  erb :edit_post

end

post '/category/posts/:post_id/:edit_key' do
  puts "Inside the post method"
  p params[:edit_key]
  @post = Post.find_by_edit_key(params[:edit_key])
  @post.update_attributes(:title => params[:updated_title], :body => params[:updated_body])
end
