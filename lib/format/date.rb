module Format; module Date

  def self.simple(date)
    return '' if date.nil?
    date.strftime("%m/%d/%Y")
  end

end; end

