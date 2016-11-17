class PopulateQuizAuditPermission < ActiveRecord::Migration[4.2]
  tag :postdeploy

  def up
    DataFixup::AddRoleOverridesForNewPermission.send_later_if_production(:run, :manage_account_memberships, :view_quiz_answer_audits)
  end

  def down
  end
end
