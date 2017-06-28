class Taco
  include Mongoid::Document
  include Mongoid::Timestamps

  field :meat
  field :notes
  field :rice, type: Boolean
  field :salsa, type: Boolean

  default_scope -> { asc :created_at }
end
