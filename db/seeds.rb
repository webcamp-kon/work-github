# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#coding: utf-8
Manager.create(:first_name => '山田', :last_name => '太郎', :email => 'admin@root.jp', :encrypted_password => 'rootadmin')
Genre.create(:name => 'Jポップ')
Label.create(:name => 'Queen_record')
Artist.create(:name => '米津玄師')
Product.create!(:jacket_image_id => open('app/assets/images/no_image.jpg'), :stock_quantity => 90, :price => 1000, :is_selling => true, :artist_id => 1, :label_id => 1,:genre_id => 1, :name => 'CD')
