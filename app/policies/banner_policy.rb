class BannerPolicy < ApplicationPolicy

  def update?
    return true if banner_approved? && admin?
    return true if user_or_admin && !banner_approved?
  end

  private

    def user_or_admin
      record.user_id == user.id || admin?
    end

    def admin?
      admin_types.include?(user.type)
    end

    def banner_approved?
      record.approved?
    end
end