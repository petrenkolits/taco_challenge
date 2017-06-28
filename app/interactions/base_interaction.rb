class BaseInteraction < ActiveInteraction::Base
  class << self
    def serialize_with(serializer)
      @serializer = serializer
    end

    def get_serializer
      @serializer || (superclass.get_serializer if superclass.respond_to? :get_serializer)
    end
  end

  delegate :get_serializer, to: 'self.class'

  def run
    res = super
    self.result = if errors.any?
      errors
    else
      get_serializer ? get_serializer.serialize(res) : res
    end
  end
end
