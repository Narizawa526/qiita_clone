# frozen_string_literal: true

class User < ApplicationRecord

  validates :email, :name, :encrypted_password, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}}
  
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :article_likes, dependent: :destroy
end
