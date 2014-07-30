# Other authorizers should subclass this one
class ApplicationAuthorizer < Authority::Authorizer
  # Any class method from Authority::Authorizer that isn't overridden
  # will call its authorizer's default method.
  #
  # @param [Symbol] adjective; example: `:creatable`
  # @param [Object] user - whatever represents the current user in your app
  # @return [Boolean]
  def self.default(adjective, user)
	user.has_role? :admin
  end

  def self.updatable_by?(user)
    user.has_role?(:admin) || user.has_role?(:editor)
  end
  
  def self.creatable_by?(user)
    user.has_role?(:admin) || user.has_role?(:editor)
  end

  def self.readable_by?(user)
    user.has_role?(:admin) || user.has_role?(:editor)
  end

  def self.deletable_by?(user)
    user.has_role?(:admin)
  end

end
