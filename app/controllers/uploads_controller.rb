class UploadsController < ApplicationController

	def index
		@uploads = Upload.all
	end

	def new
		@upload = Upload.new
	end

	def create
		@upload = Upload.new
		@upload.parse_file(params)
		redirect_to uploads_path
	end
end
