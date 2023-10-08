class GenerateGiftPdf
  def initialize(title, duration, end_validity_date, checkout_id)
    @title = title
    @duration = duration
    @end_validity_date = end_validity_date
    @checkout_id = checkout_id
  end

  def call
    pdf = CombinePDF.load "carte_cadeau_template.pdf"

    pdf.pages[1].textbox "#{@title}", x: 0, y: 225, font_size: 18
    pdf.pages[1].textbox "#{@duration} min", x: -40, y: 125, font_size: 16
    pdf.pages[1].textbox "#{@end_validity_date}", x: 110, y: -240, font_size: 16
    pdf.pages[1].textbox "#{@checkout_id}", x: 270, y: -270, font_size: 10, opacity: 0.5

    pdf.save "carte_cadeau.pdf"
  end
end
