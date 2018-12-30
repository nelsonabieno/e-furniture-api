# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.create([{ :name => 'super' }, { :name => 'admin' }, { :name => 'user' }, { :name => 'guest' }])
user = User.new( {
                 :first_name => ENV['SUPER_FIRST_NAME'],
                 :last_name => ENV['SUPER_LAST_NAME'],
                 :phone_no => ENV['SUPER_PHONE_NO'],
                 :email => ENV['SUPER_EMAIL']
             })
user.save! if user.valid?

OrderStatus.create([ { :status => 'processed' },
                      { :status => 'shipped' },
                      { :status => 'delivered' },
                      { :status => 'processed' },
                      { :status => 'rejected' }
                   ])