require_relative 'database'

class Citizen


  def store_citizen_details(citizen_detail, database_name = "capital_oneder_dev")
    con = Database.connect(database_name)
    position = 1
    p citizen_detail
    citizen_detail.each do |item|
      p item
      con.exec("INSERT INTO Citizens VALUES(#{position}, '#{item[:salutation]}', '#{item[:first_name]}', '#{item[:last_name]}', '#{item[:previous_country]}', '#{item[:gender]}')")
      position += 1
    end
    con.close if con

  end
end
