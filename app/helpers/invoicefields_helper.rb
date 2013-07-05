module InvoicefieldsHelper
  def field_types
    I18n.t(:field_types).map { |key, value| [ value, key ] }
  end
end
