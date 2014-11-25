FactoryGirl.define do
  factory :info_profissional do
  	inicio Date.new(2013,01,01)
	fim Date.new(2014,01,01)
	empresa 'SEDUC'
	cargo 'Analista Desenvolvedor'

	after(:build) do |info_profissional|
      info_profissional.atividades << FactoryGirl.build(:atividade)
    end

  end
end