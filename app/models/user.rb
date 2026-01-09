# app/models/user.rb
class User < ApplicationRecord
  has_secure_password # คำสั่งนี้จะจัดการเรื่องการเช็ครหัสผ่านให้เอง

  validates :email, presence: true, uniqueness: true
end