FactoryGirl.define do
  factory :curso do
  	 descricao "Curso de Android"
	 inicio Date.new(2013,01,01)
	 fim Date.new(2014,01,01)
	 instituicao "Laboratorio da Universidade Digital"
  end
end