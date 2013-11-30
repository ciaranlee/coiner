class Registration < ActiveRecord::Base
  belongs_to :account_worker

  before_create :attach_worker

  def attach_worker
    used_ids = Registration.pluck(:account_worker_id)
    all_ids = AccountWorker.pluck(:id)
    available_ids = all_ids - used_ids
    if available_ids.any?
      self.account_worker_id = available_ids.first
    else
      false
    end
  end
end
