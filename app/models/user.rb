# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, :name, :encrypted_password, presence: true
  extend Devise::Models
  include DeviseTokenAuth::Concerns::User
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, { format: { with: VALID_EMAIL_REGEX } }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :article_likes, dependent: :destroy
end
