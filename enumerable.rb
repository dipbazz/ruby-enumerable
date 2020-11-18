# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Style/For
module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    for item in self
      yield item
    end
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    counter = 0
    my_each do |item|
      yield item, counter
      counter += 1
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    selected = []
    my_each { |item| selected.push(item) if yield(item) }
    selected
  end

  def my_all?(to_check = nil)
    my_each { |value| return false unless value }

    my_each { |value| return false unless yield(value) } if block_given?

    if to_check.is_a?(Class)
      my_each { |value| return false unless value.is_a?(to_check) }

    elsif to_check.is_a?(Regexp)
      my_each { |value| return false unless value.to_s.match(to_check) }

    elsif !to_check.nil?
      my_each { |value| return false unless value == to_check }
    end
    true
  end

  def my_any?(to_check = nil)
    my_each { |value| return true if value } if !block_given? && to_check.nil?

    my_each { |value| return true if yield(value) } if block_given?

    if to_check.is_a?(Class)
      my_each { |value| return true if value.is_a?(to_check) }

    elsif to_check.is_a?(Regexp)
      my_each { |value| return true if value.to_s.match(to_check) }

    elsif !to_check.nil?
      my_each { |value| return true if value == to_check }
    end
    false
  end

  def my_none?(to_check = nil)
    my_each { |value| return false if value } if !block_given? && to_check.nil?

    my_each { |value| return false if yield(value) } if block_given?

    if to_check.is_a?(Class)
      my_each { |value| return false if value.is_a?(to_check) }

    elsif to_check.is_a?(Regexp)
      my_each { |value| return false if value.to_s.match(to_check) }

    elsif !to_check.nil?
      my_each { |value| return false if value == to_check }
    end
    true
  end

  def my_count(to_check = nil)
    counter = 0
    if !to_check.nil?
      my_each { |value| counter += 1 if value == to_check }
    elsif block_given?
      my_each { |value| counter += 1 if yield(value) }
    else
      my_each { counter += 1 }
    end
    counter
  end

  def my_map(my_proc = nil)
    map_list = []

    if my_proc.is_a?(Proc)
      my_each { |value| map_list << my_proc.call(value) }
      return map_list
    end

    return to_enum(:my_map) if !block_given? and my_proc.nil?

    my_each { |value| map_list << yield(value) } if block_given?
    map_list
  end

  def my_inject(*args)
    raise ArgumentError, "wrong number of arguments (given #{args.length}, expected 0..2)" if args.length > 2

    if args.length == 1
      if args[0].is_a?(Symbol) or args[0].to_s.match(%r{[+\-*/]})
        operator = args[0].to_sym
      else
        initial = args[0]
      end
    elsif args.length == 2
      initial = args[0]
      operator = args[1].to_sym
    end

    total = initial
    my_each do |value|
      total = if operator
                initial ? total.send(operator, value) : initial = value
              else
                initial ? yield(total, value) : initial = value
              end
    end
    total
  end
end

def multiply_els(array)
  product = 1
  array.my_each { |i| product *= i }
  product
end
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Style/For
