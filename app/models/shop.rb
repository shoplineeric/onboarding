class Shop
  include Mongoid::Document

  embedded_in :user

  field :name, type: String


end
