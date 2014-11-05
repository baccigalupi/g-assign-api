class Authenticate < Struct.new(:username, :password)
  def valid?
    instructor? || student?
  end

  def instructor?
    username == 'staff' && password == 'stack-full'
  end

  def student?
    username == 'gschool-sf' && password == 'full-stack'
  end
end
