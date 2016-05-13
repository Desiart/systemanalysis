class SystemTypeList < ActiveRecord::Base
	belongs_to :system
	belongs_to :system_type
end
