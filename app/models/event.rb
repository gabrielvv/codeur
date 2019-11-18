class Event < ApplicationRecord
    validates :name, presence: true, length: { minimum: 5 }
    validates :description, presence: true, length: { maximum: 300 }
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :date, presence: true
end
