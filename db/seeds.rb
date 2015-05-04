# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Account Roles
roles = AccountRole::ROLES.map(&:to_s).map(&:titlecase)
roles.each {|n| AccountRole.find_or_create_by(name: n)}

# Account Types
types = AccountType::TYPES.map(&:to_s).map(&:titlecase)
types.each {|n| AccountType.find_or_create_by(name: n)}
