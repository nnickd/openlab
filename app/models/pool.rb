class Pool < ApplicationRecord
  belongs_to :project
  has_many :payments
  validates :goal, presence: true

  def progress
    pledged.to_f / goal * 100
  end

  def visual_progress
    progress <= 100 ? progress : 100
  end

  def backers
    payments.map { |pay| pay.user.username }.uniq.length
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

  def failure?
    return true if deadline - Time.now <= 0 && progress < 100
    false
  end

  def success?
    return false if failure?
    return true if progress > 100
    false
  end

  def still_in_progress?
    return false if failure || success
    true
  end

end
