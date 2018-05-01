describe Citizen do

  let(:citizen)     { described_class.new }
  let(:mock_citizen)    { [{ "salutation" => "Mr", "first_name" => "Benjamin", "last_name" => "Pourian", "previous_country" => "United Kingdom", "gender" => "Male"}] }

  context "#store_citizen_details" do
    it "Should change database count by one" do
      Citizen.store_citizen_details(mock_citizen, 'capital_oneder_test')
      con = Database.connect('capital_oneder_test')
      result = con.query("SELECT * FROM Citizens;")

      expect(result.num_tuples).to eq(1)
      con.close if con
    end
  end
end
