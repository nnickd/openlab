class Pool < ApplicationRecord
  belongs_to :project
  has_many :payments

  def progress
    pledged.to_f / goal * 100
  end

  def visual_progress
    progress <= 100 ? progress : 100
  end

  def backers
    payments.length
  end

  def creator
    project.user
  end

  def days_left
    ((deadline - Time.now) / 1.day).round
  end

  def add_payment(payment)
    total = payment.amount + pledged
    update(pledged: total)
  end

end
