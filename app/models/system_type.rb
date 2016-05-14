class SystemType < ActiveRecord::Base
	has_many :system_type_lists
	has_many :system_types, through: :system_type_list
end
