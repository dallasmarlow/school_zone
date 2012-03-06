# school zone
$:.unshift File.join File.dirname(__FILE__), 'school_zone'
%w[school_zone enumerable].each {|f| require f}