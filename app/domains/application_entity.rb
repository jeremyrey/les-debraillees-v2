# frozen_string_literal: true

class ApplicationEntity < ROM::Struct

  def persisted?
    respond_to?(:id) && id.present?
  end

end
