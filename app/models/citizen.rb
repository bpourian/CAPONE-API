require_relative 'database'
require 'json'

class Citizen
  def self.store_citizen_details(citizen_detail, database_name = "capital_oneder_dev")
    con = Database.connect(database_name)
    position = 1

    citizen_detail.each do |item|
      con.exec("INSERT INTO Citizens(salutation, first_name, last_name, previous_country, gender, citizen_id)
      VALUES('#{item['salutation']}', '#{item['first_name']}', '#{item['last_name']}', '#{item['previous_country']}', '#{item['gender']}', '#{item['citizen_id']}')")

      position += 1
    end
    con.close if con
  end

  def self.convert_to_hash(salutation, first_name, last_name, previous_country,
    gender, citizen_id)

    [
      {
      "salutation" => salutation,
      "first_name" => first_name,
      "last_name" => last_name,
      "previous_country" => previous_country,
      "gender" => gender,
      "citizen_id" => citizen_id
    }
  ]
  end

  def self.random_id_generator
    random = Random.new
    random.rand(300..10000).to_s
  end
end
