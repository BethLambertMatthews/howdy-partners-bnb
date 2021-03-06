require 'database/database_connection'

describe DatabaseConnection do
  let(:connection) { double :connection }

  describe '#setup' do
    it 'sets up a connection to the database' do
      expect(PG).to receive(:connect).and_return(connection)
      DatabaseConnection.setup('howdy_partners_test')
    end
  end

  describe '#query' do
    it 'sends a query to the postgres api' do
      expect(PG).to receive(:connect).and_return(connection)
      expect(connection).to receive(:exec_params).with("query", ['params'])

      DatabaseConnection.setup(connection)
      DatabaseConnection.query("query", ['params'])
    end
  end
end
