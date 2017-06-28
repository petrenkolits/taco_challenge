class Tacos::Create < BaseInteraction
  string :meat
  string :notes, default: nil
  boolean :salsa, default: false
  boolean :rice, default: false

  serialize_with TacoSerializer

  def execute
    Taco.create inputs
  end
end
