class Code
  attr_reader :color_array, :valid_colors

  def initialize color_array
    @color_array =  color_array
    @valid_colors = ["purple","blue","green","yellow","orange","red"]
  end
  def randomize
    (4).times do |i|
      @color_array[i] = @valid_colors[rand(6)]
    end
  end
  def is_valid?
    if @color_array.length != 4
      return false
    end

    (4).times do |i|
      if !(@valid_colors.include? @color_array[i])
        return false
      end
    end

    true
  end
  def print_code

    (4).times do |i|
      print "#{@color_array[i]} "
    end
  end
end
