def basic_student_login
  basic_login('gschool-sf', 'full-stack')
end

def basic_instructor_login
  basic_login('staff', 'stack-full')
end

def basic_login(username, password)
  request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
end
