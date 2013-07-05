class InvoicePdf < Prawn::Document
  def initialize(invoice, user, view)
    super()
    @invoice = invoice 
    @view = view
    @user = user
    pdf_header
    invoice_number
    line_items
    total_price
  end
  
  def pdf_header
    text "#{@user.companyname}", size: 16
    text "#{@user.address}"
    text "#{@user.city}" 
    text "#{@user.postalcode}"
    text "#{@user.phone}" 
    text "#{@user.email}" 
    text "#{@user.vat}"
    #move_down 10
    bounding_box([350,cursor],:width=>200,:height=>155) do
      text "Customer:", style: :bold, position: :right
      text "#{@invoice.customer.fullname}" 
      text "#{@invoice.customer.address}"
      text "#{@invoice.customer.city}"
      text "#{@invoice.customer.postalcode}"
      text "#{@invoice.customer.phone}" 
      text "#{@invoice.customer.email}" 
      text "#{@invoice.customer.vat}"    
    end
    
  end
  
  def invoice_number
    move_down 20
    text I18n.t("Invoice") + " \##{@invoice.invoicenumber}", size: 15, position: :right, style: :bold  
  end
  
  def line_items
    move_down 20
    table line_item_rows do
      row(0).font_style = :bold
      rows(0).width = 133
      columns(1..3).align = :right
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end
  end

  def line_item_rows
    [[I18n.t("Product"), I18n.t("Qty"), I18n.t("Unit Price"), I18n.t("Amount")]] +
    @invoice.invoicefields.map do |field|
      
      if field.fieldtype.start_with?("percentage")
        [field.title, field.units, field.rate, field.amount.to_s + "%"]
      else
        [field.title, field.units, price(field.rate), price(field.amount)]
      end
    end
  end
  
  def price(num)
    @view.number_to_currency(num, locale: @user.lang)
  end
  
  def total_price
    move_down 15
    text I18n.t('Total Price') + ": #{price(@invoice.amount)}", size: 14, style: :bold
  end
end