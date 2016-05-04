module UsersHelper
    
  def is_entry?
    current_user && current_user.permission_level == 0
  end
    
  def is_standard?
    current_user && current_user.permission_level == 1
  end
  
  def is_admin?
    current_user && current_user.permission_level == 2
  end
  
  def valid_password?(uid, upassword)
      !User.find_by(id: uid).nil? && User.find_by(id:uid).password_digest.eql?(User.digest(upassword))
  end
end
