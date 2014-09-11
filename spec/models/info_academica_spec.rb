require 'rails_helper'

describe InfoAcademica, :type => :model do
  
	it "deve ser valido" do
		info_academica = create_info_academica

		info_academica.should be
		info_pessoal.cv.should be
	end

	private
		def create_info_academica(option = {})
			cv = Cv.create

			InfoAcademica.create({
				:nivel => :graduacao,
				:curso => "Computação - 8º Semestre",
				:incompleto => true,
				:instituicao => "Faculdade Farias Brito",
				:inicio => Date.new(2007,1,3),
				:fim => Date.new(2014,9,15) ,
				:cv_id => cv.id
			}.merge(option))
		end

end
