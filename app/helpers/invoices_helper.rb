module InvoicesHelper
  def invoice_types
    I18n.t(:invoice_types).map { |key, value| [ value, key ] }
  end
  
  def invoice_status
    I18n.t(:invoice_status).map { |key, value| [ value, key ] }
  end
end