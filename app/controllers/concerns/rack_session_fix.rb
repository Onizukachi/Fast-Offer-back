# frozen_string_literal: true

# Если нужно отключить куки и сессии, придется фиксить баг с девайсом
# нужно сэмулировать фейк сессию, но тут тоже есть баг, когда мы пытаемся удалить профиль #DESTROY /sign_up
# получаем NoMethodError (undefined method `destroy' for {}:Devise::Controllers::Rails7ApiMode::FakeRackSession):
# https://github.com/heartcombo/devise/pull/5474
module RackSessionFix
  extend ActiveSupport::Concern

  class FakeRackSession < Hash
    def enabled?
      false
    end
  end

  included do
    before_action :set_fake_rack_session_for_devise

    private

    def set_fake_rack_session_for_devise
      request.env['rack.session'] ||= FakeRackSession.new
    end
  end
end
