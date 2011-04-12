class Account

  include DataMapper::Resource

  property :id, Serial
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :website

  def domain
    self.website.domain
  end
  
end
