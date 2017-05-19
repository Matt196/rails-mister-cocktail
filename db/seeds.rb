# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cocktail.destroy_all

Cocktail.create(name: 'Perrier Citron')
Cocktail.create(name: "Menthe à l'eau")
Cocktail.create(name: "Whisky Coca")

urls = [
'https://c1.staticflickr.com/1/44/191021782_eb35d3eb32_b.jpg',
'https://cuisineetc.files.wordpress.com/2011/07/eau-menthe-gingembre.jpg',
'http://static.lexpress.fr/medias_9222/w_2048,h_890,c_crop,x_0,y_283/w_2000,h_1125,c_fill,g_north/v1391610350/glasses-of-scotch-whisky-sit-on-a-table-during-a-tour-of-the-glenfiddich-scotch-whisky-distillery-in-dufftown-scotland_4721929.jpg'
]

Cocktail.all.each.with_index do |cocktail, index|
  cocktail.photo_url = urls[index]
  cocktail.save
end

Dose.destroy_all

Ingredient.destroy_all

data = RestClient.get "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
parsed = JSON.parse(data)
drinks = parsed['drinks']
drinks.each { |item| Ingredient.create(name: item["strIngredient1"]) }


