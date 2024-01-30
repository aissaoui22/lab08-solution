class User < ApplicationRecord
    belongs_to :band

    has_secure_password

    validates :first_name, :last_name, :email, presence: true
    validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

    def proper_name
    "#{first_name} #{last_name}"
    end

    def self.authenticate(email,password)
        find_by_email(email).try(:authenticate, password)
    end
end
