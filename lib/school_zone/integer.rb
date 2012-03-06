class Integer

  def times_in interval, &block
    interval = SchoolZone::Interval.new *interval.flatten

    self.times do |i|
      interval.checkpoint = Time.now
      yield if block_given?
      interval.adjust i
    end
  end

end