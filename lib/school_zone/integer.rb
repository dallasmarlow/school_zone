class Integer

  def times_in duration, &block
    duration = SchoolZone.interval *duration.flatten

    self.times do
      yield if block_given?
      sleep duration.to_f / self
    end
  end

  def times_at frequency, &block
    frequency = SchoolZone.interval *frequency.flatten

    self.times do
      yield if block_given?
      sleep frequency
    end
  end

  def times_a unit, &block
    frequency = SchoolZone.interval 1, unit

    loop do
      yield if block_given?
      sleep frequency.to_f / self
    end
  end

end