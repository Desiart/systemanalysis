class System < ActiveRecord::Base
	has_many :system_lists
	has_many :users, :through => :system_lists
	has_many :tasks
	has_one :system_type_list
	has_one :system_type, :through => :system_type_list
end
