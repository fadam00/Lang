class DropCommontatorSubscriptionsTable < ActiveRecord::Migration[5.0]
  def change

  	drop_table :commontator_subscriptions
  end
end
