# frozen_string_literal: false

# Medium 1.6 problem
class CustomSet
  attr_reader :set

  def initialize(set = [])
    @set = set
  end

  def empty?
    set.empty?
  end

  def contains?(arg)
    set.include?(arg) ? true : false
  end

  def subset?(new_set)
    set.all? { |el| new_set.set.include?(el) }
  end

  def disjoint?(new_set)
    set.none? { |el| new_set.set.include?(el) }
  end

  def eql?(other)
    set.uniq.sort == other.set.uniq.sort
  end

  def add(element)
    set << element unless contains?(element)
    self
  end

  def ==(other)
    set == other.set
  end

  def intersection(new_set)
    shared_elements = set.select do |el|
      new_set.set.include?(el)
    end

    CustomSet.new(shared_elements)
  end

  def difference(new_set)
    new_elements = set.reject do |el|
      new_set.set.include?(el)
    end

    CustomSet.new(new_elements)
  end

  def union(new_set)
    new_elements = set + new_set.set
    CustomSet.new(new_elements.uniq.sort)
  end
end
