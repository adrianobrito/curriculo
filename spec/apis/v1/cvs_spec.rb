require 'spec_helper'

describe '/api/v1/cvs', :type => :api do

	context "criando um cv" do

		let(:url) { "/api/v1/cvs" }

		it "criando com sucesso" do
			post "#{url}.json", :cv => {

			}
		end

	end

	it "deve ser possivel cadastrar informacoes de usuario" do
		post 

	end

end