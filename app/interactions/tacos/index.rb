class Tacos::Index < BaseInteraction
  serialize_with TacoSerializer

  def execute
    Taco.all.to_a
  end
end
