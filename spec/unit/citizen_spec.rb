describe Citizen do

  let(:citizen)             { described_class.new }
  let(:mock_citizen)        { [{ "salutation" => "Mr", "first_name" => "Benjamin",
    "last_name" => "Pourian", "previous_country" => "United Kingdom", "gender" => "Male", "citizen_id" => "Pourian1234"}] }

  let(:mock_citizen_json)    { [{"salutation"=>"Mr", "first_name"=>"Benjamin",
    "last_name"=>"Pourian", "previous_country"=>"France", "gender"=>"Male", "citizen_id"=>"Pourian1234"}] }

  context "#store_citizen_details" do
    it "Should change database count by one" do
      Citizen.store_citizen_details(mock_citizen, 'capital_oneder_test')
      con = Database.connect('capital_oneder_test')
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
end
