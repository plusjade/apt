class Account

  include DataMapper::Resource
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  property :id, Serial
  
  belongs_to :website

  def domain
    self.website.domain
  end
  
end
