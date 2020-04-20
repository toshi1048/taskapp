class TaskMailer < ApplicationMailer
  default from: 'taskapp@example.com'
  
  def creation_email(task)
    @task = task
    mail(
      subject: 'タスク作成完了メール',
      to: 'user@example.com',
      from: 'taskapp@example.com'
    )
  end
end
