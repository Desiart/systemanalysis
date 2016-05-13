class System < ActiveRecord::Base
	has_many :users, through: :system_list
	has_one  :system_type, through: :system_type_list
end
