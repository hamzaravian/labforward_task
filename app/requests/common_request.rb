class CommonRequest
  include ActiveModel::Model
  include ActiveModel::Serializers::JSON

  def validate_errors?(scenario = [])
    self.invalid?(scenario)
  end

  def validate_exceptions?(scenario = [])
    raise "Error Found in #{self.class}: #{self.errors.details}" if self.invalid?(scenario)
    return true
  end

end
