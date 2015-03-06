class Weather
  include NoBrainer::Document

  field :opnw_id, type: Integer
  field :name, type: String
  field :temp, type: Hash
  field :wind, type: Hash
  index :opnw_id

  validates :opnw_id, presence: true
  validates :name, presence: true
end
