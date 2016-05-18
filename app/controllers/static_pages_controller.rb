class StaticPagesController < ApplicationController
	def index
		@systems = System.all
	end
end
