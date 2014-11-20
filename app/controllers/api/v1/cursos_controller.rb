class Api::V1::CursosController < Api::V1::BaseController

	def update
		curso = Curso.find(params[:id])
		curso.update_attributes(params[:curso])
		respond_put(curso)
	end

	def create
		curso = Curso.create(params[:curso])
		
		if curso.valid?
			respond_with(curso, :location => api_v1_cv_curso_path(curso.cv, curso))
		else
			respond_with(curso)
		end
	end
	
	def destroy
		curso = Curso.find(params[:id])
		curso.destroy

		respond_with(curso)
	end

	def show
		curso = Curso.find(params[:id])
		respond_with(curso)
	end

end