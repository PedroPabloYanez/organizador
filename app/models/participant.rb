class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :task

  validates_uniqueness_of  :user_id,scope: [:task_id],  allow_blank: false, message: "participants cant be repeated in same task"
end
