class Tacos::Destroy < BaseInteraction
  string :id

  validates :taco, presence: true

  def execute
    taco.destroy
  end

  def taco
    @taco ||= Taco.find id
  end
end
