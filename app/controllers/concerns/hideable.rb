module Hideable

  extend ActiveSupport::Concern

  included do
    scope :visible, -> { where(hidden: false) }
    scope :hidden, -> { where(hidden: true) }
  end

  def hide!
    self.update(hidden: true, hidden_at: Time.current)
  end

end