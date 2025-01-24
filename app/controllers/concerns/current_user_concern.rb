# frozen_string_literal: true

module CurrentUserConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
  end

  def set_current_user
    # Stub: In a real app, this would use sessions/JWT/etc
    # For now, we'll create or find a default test user
    @current_user = User.find_or_create_by!(
      email: 'test@example.com',
      name: 'Test User'
    )
  end

  def current_user
    @current_user
  end
end
