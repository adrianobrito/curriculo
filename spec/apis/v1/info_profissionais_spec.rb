require 'rails_helper'

describe '/api/v1/cvs/info_profisionais', :type => :api do

	let(:cv) { FactoryGirl.create(:cv) }
	let(:url) { "/api/v1/cvs/#{cv.id}/info_profissionais" }

	it "atualizando uma informação profissional" do
		info_profissional = cv.info_profissionals[0]
		nova_empresa = "NOVA"

		put "#{url}/#{info_profissional.id}.json", 
			 :info_profissional => FactoryGirl.attributes_for(:info_profissional)
			 								  .merge({
			 								  		:id => info_profissional.id,
			 								  		:cv_id => cv.id,
			 								  		:empresa => nova_empresa
			 								   })

		info_profissional = JSON.parse last_response.body 	

		info_profissional["id"].should be
		info_profissional["empresa"].should eql nova_empresa
		last_response.status.should eql(200)

	end

end