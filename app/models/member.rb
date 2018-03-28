# == Schema Information
#
# Table name: members
#
#  id           :integer          not null, primary key
#  name         :string           default(""), not null
#  birthday     :date             not null
#  gender       :string           default(""), not null
#  phone        :string           default(""), not null
#  skin         :string
#  hair         :string
#  avatar       :string
#  remark       :string
#  member_code  :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  email        :string           default(""), not null
#  fax          :string
#  password     :string
#  group        :string
#  zip          :string
#  county       :string
#  address      :string
#  bonus        :integer          default(0)
#  skin_type_id :integer
#  hair_id      :integer
#  hair_code    :string
#

class Member < ApplicationRecord
  belongs_to :skin_type
  belongs_to :hair_type, foreign_key: "hair_code", primary_key: "code"
  belongs_to :member_type, foreign_key: "member_code", primary_key: "code", optional: true
  has_many :orders
end
