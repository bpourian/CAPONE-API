describe Citizen do

  let(:citizen)                   { described_class.new }

  let(:mock_citizen)              { [{ "salutation" => "Mr", "first_name" => "Benjamin",
    "last_name" => "Pourian", "previous_country" => "United Kingdom", "gender" => "Male", "citizen_id" => "Pourian1234"}] }

  let(:mock_citizen_json)         { [{"salutation"=>"Mr", "first_name"=>"Benjamin",
    "last_name"=>"Pourian", "previous_country"=>"France", "gender"=>"Male", "citizen_id"=>"Pourian1234"}] }

  let(:mock_single_citizen_api)   { {"salutation" => "Mr","first_name" =>
    "Ben","last_name" => "Pourian","previous_country" => "UK","gender" => "Male"} }

  context "#store_citizen_details" do
    it "Should change database count by one" do
      Citizen.store_citizen_details(mock_citizen)
      con = Database.connect
      result = con.query("SELECT * FROM Citizens;")

      expect(result.num_tuples).to eq(1)
      con.close if con
    end
  end

  context "#random_id_generator" do
    it "Should generate a random number" do
      allow(Citizen).to receive(:random_id_generator).and_return("1000")
      expect(Citizen.random_id_generator).to eq("1000")
    end
  end

  context "#convert_to_hash" do
    it "Should return json format" do
      expect(Citizen.convert_to_hash("Mr", "Benjamin", "Pourian", "France", "Male",
        "Pourian1234")).to eq(mock_citizen_json)
    end
  end

  context "#get_citizens_in_json" do
    it "Should get data from db and return json" do
      Citizen.store_citizen_details(mock_citizen)

      expect(Citizen.get_citizens_in_json).to eq(json_response)
    end
  end

  context "#input_from_api" do
    it "Should store api put request in db" do
      Citizen.input_from_api(mock_single_citizen_api)
      con = Database.connect
      result = con.query("SELECT * FROM Citizens;")

      expect(result.num_tuples).to eq(1)
      con.close if con
    end
  end
end
