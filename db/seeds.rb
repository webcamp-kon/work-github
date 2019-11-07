# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#coding: utf-8

Manager.create(first_name:'テスト', last_name:'太郎', email:'admin@root.jp', password:'aaaaaaa')
Artist.create(:name=>'星野源')
Label.create(:name=>'SpeedStarRecords')
Genre.create(:name=>'ロック')
Genre.create(:name => 'Jポップ')
Label.create(:name => 'Queen_record')
Artist.create(:name => '米津玄師')
# Product.create!(:jacket_image => open('db/data/no_image.jpg'), :stock_quantity => 90, :price => 1000, :is_selling => true, :artist_id => 1, :label_id => 1,:genre_id => 1, :name => 'CD')
