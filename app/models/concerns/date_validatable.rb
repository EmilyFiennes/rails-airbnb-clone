module DateValidatable
  def start_on_cannot_be_in_the_past
    if start_on.present? && start_on < Date.today
      errors.add(:start_on, "start date cannot be in the past")
    end
  end

  def end_on_cannot_be_less_than_start_on
    if end_on.present? && end_on < start_on
      errors.add(:end_on, "end date cannot be in the past")
    end
  end
end
