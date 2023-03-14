class Nameable
  def correct_name
    raise NotImplementedError "#{self.class} has not been initilize"
  end
end
