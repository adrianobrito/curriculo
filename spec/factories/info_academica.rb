FactoryGirl.define do
  factory :info_academica do
  	nivel :ensino_superior_graduacao
	curso "Computação - 8º Semestre"
	incompleto true
	instituicao "Faculdade Farias Brito"
	inicio Date.new(2007,1,3)
	fim Date.new(2014,9,15)
  end
end