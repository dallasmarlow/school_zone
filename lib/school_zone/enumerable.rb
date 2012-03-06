module Enumerable

  def each_in interval
    interval  = SchoolZone::Interval.new *interval.flatten
    iteration = 0

    each do |object|
      interval.checkpoint = Time.now
      yield object
      interval.adjust iteration
      iteration += 1
    end
  end

end