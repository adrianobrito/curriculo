class InfoPessoal < ActiveRecord::Base
	enum estadoCivil: [:solteiro, :casado]

end
