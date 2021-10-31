# == Schema Information
#
# Table name: participants
#
#  id         :bigint           not null, primary key
#  role       :integer
#  user_id    :bigint           not null
#  task_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :task

  validates_uniqueness_of  :user_id,scope: [:task_id],  allow_blank: false, message: "participants cant be repeated in same task"
end
