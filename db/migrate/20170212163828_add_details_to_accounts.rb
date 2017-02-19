class AddDetailsToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :login, :string
    add_column :accounts, :donate, :string
    add_column :accounts, :group, :string
  end
end
