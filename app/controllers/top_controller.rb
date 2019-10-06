class TopController < ApplicationController   
    ETHEREUM_TOKEN_PATH = "#{Dir.pwd}/contracts/RoomFactory.sol"
    GANACHE_URL = 'HTTP://127.0.0.1:7545'
  
    def index
      # binding.pry
      @client = Ethereum::HttpClient.new(GANACHE_URL) #①
      @contract = Ethereum::Contract.create(file: ETHEREUM_TOKEN_PATH, client: @client) #②
      @contract.deploy_and_wait #③
    end

end