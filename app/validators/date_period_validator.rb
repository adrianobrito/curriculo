class DatePeriodValidator < ActiveModel::Validator
  
  def validate(record)
  	record.errors.add(:inicio, "Data do Início não pode ser maior que a data do fim") if record.inicio > record.fim
  end

end