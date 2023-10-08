class FetchEndValidityDate
  def initialize(inital_date, months)
    @inital_date = inital_date
    @months = months
  end

  def call
    result = DateTime.parse(@inital_date).advance(months: @months).strftime("%d-%m-%Y")

    result
  end
end
