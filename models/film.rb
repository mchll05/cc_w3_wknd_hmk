require_relative("../db/sql_runner")

class Film

attr_reader :id
attr_accessor :title, :price

def initialize(options)
  @id = options['id'].to_i if options['id']
  @title = options['title']
  @price = options['price']
end

  def save()
    sql = "INSERT INTO films (title, price)
          VALUES ($1, $2)
          RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films
    SET (title, price) = ($1, $2)
    WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE * from films
          WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def customers
    sql = "SELECT customers.* FROM customers
          INNER JOIN tickets ON customers.id = tickets.customer_id
          WHERE customer_id = $1"
    values = [@id]
    customer_info = SqlRunner.run(sql, values)
    return Customer.map_items(customer_info)
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def
    sql = "SELECT * FROM customers
          INNER JOIN tickets ON tickets.customer_id = customers.id
          WHERE film_id = $1"
          values = [@id]
          SqlRunner.run(sql)(sql, values)
        end
end
