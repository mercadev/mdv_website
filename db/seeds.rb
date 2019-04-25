# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

scraper = Scrapers::ScraperDeba.new
scraper.start

Contact.where(source: "scraping_deba").destroy_all

puts "\nSaving items..."
scraper.data.each.with_index(1) do |item, i|
  puts "\nsave item #{i} : #{item.values}"
  item[:source] = "scraping_deba"
  Contact.create(item)
end
# Scrapers::NameSplitter.test