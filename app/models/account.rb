class Account < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :encryptable

  mount_uploader :avatar, AvatarUploader

  def valid_password?(password)
    if self.encrypted_password.blank?
      if Digest::MD5.hexdigest(password) == self.old_passwd
        self.password = password
        self.old_passwd = nil
        self.save!
        true
      else
        false
      end
    end
  end
end
