# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, :encrypted_password, presence: true
  extend Devise::Models

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :article_likes, dependent: :destroy

  include DeviseTokenAuth::Concerns::User
end
