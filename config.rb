
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

activate :relative_assets
activate :autoprefixer
activate :directory_indexes

helpers do
  def menu_link(link, name = link)
    unless page_classes[/(\S+\s+){#{1}}/].blank?
      klass = (link == page_classes[/(\S+\s+){#{1}}/].strip ? 'active' : nil)
    end

    link_to name.capitalize, "#{config[:host]}#{link}", class: klass
  end
end

configure :development do
  activate :livereload
  config[:host] = "/"
end

configure :build do
  activate :minify_css
  activate :minify_javascript
  config[:host] = "https://rowanhogan.github.io/box-model/"
end
