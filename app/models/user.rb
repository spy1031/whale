# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  role                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  status                 :string
#  resigned               :boolean          default(FALSE)
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :guests
  has_many :orders
  has_many :bulletins
  has_many :blogs
  
  def to_resigned
    self.update_columns(resigned: true)
  end
  
  def to_in_service
    self.update_columns(resigned: false)
  end
  
  def cashier?
    self.role == "cashier"
  end
  
  def admin?
    self.role == "admin"
  end
  
  scope :in_service, -> { where(resigned: false) }
  scope :group_by_cashier, -> { where(role: "cashier").order("created_at ASC") }
  
end
