class EthereumApiController < ApplicationController
  TRUFFLE_PATH = "#{Dir.pwd}/truffle/" # truffleで作成したプロジェクトのパス
  GANACHE_URL = 'HTTP://127.0.0.1:7545' # GANACHEを起動しているサーバー
  attr_accessor :contract, :client
 
  def initialize
    self.client = Ethereum::HttpClient.new(GANACHE_URL)
    create_default_token! if Token.count.zero?
    token = Token.first
    self.contract = Ethereum::Contract.create(name: "AppToken", truffle: { paths: [ TRUFFLE_PATH ] }, client: @client, address: token.token_address) # 保管したコントラクトのアドレスを再利用する
  end
 
  def create_default_token!
    self.client = Ethereum::HttpClient.new(GANACHE_URL)
    self.contract = Ethereum::Contract.create(name: "AppToken", truffle: { paths: [ TRUFFLE_PATH ] }, client: @client) # 画面に初回アクセス時に新しくコントラクトを作成
    token = Token.new(
      name: Token::DEFAULT_NAME,
      symbol: Token::DEFAULT_SYMBOL,
      total_supply: Token::DEFAULT_TOTAL_SUPPLY
    )
    address = contract.deploy_and_wait(token.name, token.symbol, token.total_supply) # デプロイ！
    token.token_address = address # コントラクトのアドレスを保管しておく
    token.save!
  end
 
  def get_accounts
    client.eth_accounts['result']
  end
 
  def transfer(address, amount)
    begin
      contract.transact_and_wait.transfer(address, amount) # 送金処理
    rescue => e
      Rails::logger::debug("Error token transfer. message: #{e.message}")
      false
    end
  end

end
