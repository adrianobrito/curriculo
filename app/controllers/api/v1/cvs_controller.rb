class Api::V1::CvsController < Api::V1::BaseController
	def create
		cv = Cv.create(params[:cvs])

		if cv.valid?
			respond_with(cv, :location => api_v1_cv_path(cv))
		else
			respond_with(cv)

	end
end