describe Database do
  describe '#setup' do
    it "Should connect with the test db" do
      expect(PG).to receive(:connect)
      Database.connect
    end
  end

  describe '#query' do
    it 'executes a query via PG' do
      connection = Database.connect
      expect(connection).to receive(:exec).with("SELECT * FROM Citizens;")
      Database.query("SELECT * FROM Citizens;")
    end
  end
end
