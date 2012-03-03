module Enumerable

  def each_in duration
    duration = SchoolZone.interval *duration.flatten

    each do |object|
      yield object
      sleep duration.to_f / self.count
    end
  end

  def each_at frequency
    frequency = SchoolZone.interval *frequency.flatten

    each do |object|
      yield object
      sleep frequency
    end
  end

end