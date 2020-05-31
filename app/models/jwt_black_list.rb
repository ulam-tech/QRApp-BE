# frozen_string_literal: true

# Klasa JwtBlacklist pod JWT
class JwtBlackList < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Blacklist
  self.table_name = 'jwt_blacklist'
end