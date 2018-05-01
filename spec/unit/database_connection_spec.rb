describe Database do
  describe '#setup' do
    it "Should connect with the test db" do
      expect(PG).to receive(:connect).with({:dbname=>"capital_oneder_test"})
      Database.connect('capital_oneder_test')
    end
  end

  describe '#query' do
    it 'executes a query via PG' do
      connection = Database.connect('capital_oneder_test')
      expect(connection).to receive(:exec).with("SELECT * FROM Citizens;")
      Database.query("SELECT * FROM Citizens;")
    end
  end
end
