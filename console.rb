require_relative('models/ticket')
require_relative('models/film')
require_relative('models/customer')

require('pry-byebug')

customer1 = Customer.new({ 'name' => 'Wanda', 'funds' => 50 })
customer2 = Customer.new({ 'name' => 'Zelda', 'funds' => 25 })
customer3 = Customer.new({ 'name' => 'Gertrude', 'funds' => 100 })

film1 = Film.new({ 'title' => 'Attack of the Killer Tomatoes', 'price' => '5' })
film2 = Film.new({ 'title' => 'Casablanca', 'price' => '5' })
film3 = Film.new({ 'title' => 'The Shining', 'price' => '5' })

ticket1 = Ticket.new({ 'customer_id' => customer1.id, film_id => film1.id })
ticket2 = Ticket.new({ 'customer_id' => customer2.id, film_id => film2.id })
ticket3 = Ticket.new({ 'customer_id' => customer3.id, film_id => film3.id })

binding.pry
nil
