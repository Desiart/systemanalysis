class SystemList < ActiveRecord::Base
	belongs_to :user
	belongs_to :system
end
