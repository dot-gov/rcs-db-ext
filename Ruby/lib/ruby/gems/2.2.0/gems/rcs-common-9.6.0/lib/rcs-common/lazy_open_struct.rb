require 'ostruct'

class LazyOpenStruct < OpenStruct
  def method_missing(meth, *args)
    n = meth.to_s

    if n.end_with?("?")
      n = n[0..-2]
      return @table[n] || @table[n.to_sym]
    elsif !n.end_with?("=")
      raise(NoMethodError, "no `#{meth}' member set yet")
    end

    super
  end

  def [](name)
    value = @table[name.to_sym]
    if value.respond_to?(:call)
      value = value.call
      @table[name.to_sym] = value
    end
    return value
  end

  def new_ostruct_member(name)
    name = name.to_sym
    unless respond_to?(name)
      define_singleton_method(name) { self[name] }
      define_singleton_method("#{name}=") { |x| modifiable[name] = x }
    end
    name
  end
end
