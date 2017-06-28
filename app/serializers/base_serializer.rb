class BaseSerializer
  class << self
    def serialize(data)
      data.respond_to?(:any?) ? serialize_all(data) : serialize_one(data)
    end

    def serialize_all(data)
      data.map { |i| serialize_one i }
    end

    def serialize_one(item)
      raise 'Override me'
    end
  end
end
