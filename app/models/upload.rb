class Upload < ActiveRecord::Base
	validates_uniqueness_of :filename

	def parse_file(params)
		self.content = params[:upload][:my_file].tempfile.read.force_encoding("UTF-8")
		self.filename = params[:upload][:my_file].original_filename
		self.purchase_count = (content.split(/\n/).count) -1
		total_file = 0
		if save
			content.split(/\n/).each do |line|
				parse = line.split(/\t/)
				next if parse[0] == "purchaser name"
				merchant = Merchant.where(name: parse[5], address: parse[4]).first_or_create
				item = merchant.itens.where(description: parse[1], price: parse[2].to_f).first_or_create
				purchase = Purchase.where(purchaser_name: parse[0], count: parse[3], item_id: item.id).first_or_create
				total_file += purchase.total
			end
			update_attribute(:total,total_file)
		end
	end
end
