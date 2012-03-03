# school zone
$.unshift File.join File.dirname(__FILE__), 'school_zone'
%w[school_zone integer enumerable].each {|f| require f}