FactoryGirl.define do
  factory :cv do
    after(:build) do |cv|
      cv.info_usuario = FactoryGirl.build(:info_usuario)
      cv.info_pessoal = FactoryGirl.build(:info_pessoal)
      cv.info_academicas << FactoryGirl.build(:info_academica)
      cv.info_profissionals << FactoryGirl.build(:info_profissional)
      cv.cursos << FactoryGirl.build(:curso)
      cv.qualificacaos << FactoryGirl.build(:qualificacao)
    end
  end
end
