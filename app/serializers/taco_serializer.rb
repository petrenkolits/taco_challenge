class TacoSerializer < BaseSerializer
  class << self
    def serialize_one(taco)
      taco.as_json.except('_id', 'updated_at').update('id' => taco.id.to_s)
    end
  end
end
