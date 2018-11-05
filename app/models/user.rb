class User
	include Mongoid::Document

	field :first_name, type: String
	field :last_name, type: String
	field :age, type: Integer
	field :gender, type: String
	field :address, type: Hash, default:{ :country => '', :address_1 => '', :address_2 => ''}

	validates :first_name, :last_name, presence: true
	validates :age, numericality: { greater_than: 0 }
	validates :gender, inclusion: { in: %w(male female other) }
end
