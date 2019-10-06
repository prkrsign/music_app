class CreateEthereumApis < ActiveRecord::Migration[5.2]
  def change
    create_table :ethereum_apis do |t|

      t.timestamps
    end
  end
end
