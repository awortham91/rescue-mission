class ChangeAcceptedAnswer < ActiveRecord::Migration
  def change
    remove_column(:questions, :accepted_answer_id)
    add_column(:responses, :accepted_answer, :boolean)
  end
end
