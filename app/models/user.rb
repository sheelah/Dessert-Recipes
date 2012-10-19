class User < ActiveRecord::Base
  attr_accessible :hashed_password, :name, :salt, :password,
    :password_confirmation
  has_many :ratings
  has_many :recipes

  validates :name, :presence => true, :uniqueness => true
  validates :password, :presence => true, :confirmation => true
  validates :password_confirmation, :presence => true

  def password
    @password   # instance variable
  end

  def password=(password)
    @password = password
    generate_salt
    self.hashed_password = self.class.encrypt_password(self.name, password,
      self.salt)
  end

    def self.encrypt_password(name, password, salt)
      Digest::SHA1.hexdigest("#{name}:#{password}:#{salt}")
    end

  def self.authenticate(name, password)
    # Class method. Don't need to create a new user to authenticate a user.
    if user = User.find_by_name(name)  # find name in user table
      if user.hashed_password == self.encrypt_password(
        name, password, user.salt)
        user   # return user
      end  # if not, nil is returned
    end
  end


  private
  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s  # generate random number for salt
  end


end
