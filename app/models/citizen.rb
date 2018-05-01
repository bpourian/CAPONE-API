require_relative 'database'

class Citizen
  def self.store_citizen_details(citizen_detail, database_name = "capital_oneder_dev")
    con = Database.connect(database_name)
    position = 1

    citizen_detail.each do |item|
      con.exec("INSERT INTO Citizens(salutation, first_name, last_name, previous_country, gender)
      VALUES('#{item['salutation']}', '#{item['first_name']}', '#{item['last_name']}', '#{item['previous_country']}', '#{item['gender']}')")

      position += 1
    end
    con.close if con
  end

  def self.to_json(salutation, first_name, last_name, previous_country, gender)
    [
      {
      "salutation" => salutation,
      "first_name" => first_name,
      "last_name" => last_name,
      "previous_country" => previous_country,
      "gender" => gender
    }
  ]
  end
end
