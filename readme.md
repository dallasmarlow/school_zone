# school zone
rate limited iteration.

## each

``` ruby
# attempt specified duration
objects.each_in 60 => :minutes do |object|
  object.method!
end

objects.each_in 1 => :hour do |object|
  object.method!
end

# attempt specified frequency
objects.each_at 1250 => :second do |object|
  object.method!
end

objects.each_at 1.25 => :kilohertz do |object|
  object.method!
end
```

## times
``` ruby
# attempt specified duration
1000.times_in 20 => :minutes do
  some_method
end

# attempt specified frequency
1000.times_at 20 => :minute do
  some_method
end

# attempt loop at frequency
1000.times_a :second do
  some_method
end
```
