class TopController < ApplicationController
    # ETHEREUM_TOKEN_PATH = "#{Dir.pwd}/contracts/HelloWorld.sol"
    # GANACHE_URL = 'HTTP://127.0.0.1:7545'
    
    # def index
    #     @client = Ethereum::HttpClient.new(GANACHE_URL) #①
    #     @contract = Ethereum::Contract.create(file: ETHEREUM_TOKEN_PATH, client: @client) #②
    #     @contract.deploy_and_wait('Hello, World!') #③
    # end
end
