class Bike 
  @broken = false
  # setting a property of the bike
  def report_broken
    @broken = true
  end

  # calling a property of the bike
  def working?
    !@broken
  end
end