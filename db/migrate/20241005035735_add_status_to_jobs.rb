class AddStatusToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :status, :integer, default: 0  # 0 corresponds to :pending
  end
end
