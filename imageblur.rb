class Image
  attr_accessor :image, :row_size, :column_size

  def initialize(image_data)
    self.image = Array.new { Array.new }
    self.image = image_data
    if image.size != nil
      self.row_size = image.size
      if image[0] != nil
        self.column_size = image[0].size
      else
        self.column_size = 0
      end
    else
      self.row_size = 0
      self.column_size = 0
    end
  end

  def blur
    blur_points = get_all_blur_points

    blur_points.each do |point|
      x = point[0]
      y = point[1]
      blur_single_point(x - 1, y)
      blur_single_point(x, y - 1)
      blur_single_point(x + 1, y)
      blur_single_point(x, y + 1)
      
 
     
    end

  end

  def output_image
    row = 0
    while row <= (self.row_size - 1)
      column = 0
      output = ""
      while column <= (self.column_size - 1)
        output = output + image[row][column].to_s
        column = column + 1
      end
      puts output
      row = row + 1
    end

  end

  private

  def blur_single_point(x, y)
    if valid_coordinates(x, y)
      if (blur_is_needed(x, y))
        self.image[x][y] = 1
      end
    end
  end

  def blur_is_needed(row, column)
    if self.image[row][column] == 1
      return false
    else
      return true
    end
  end

  def get_all_blur_points

    blur_points = Array.new { Array.new }
    row = 0
    while row <= (self.row_size - 1)
      column = 0
      while column <= (self.column_size - 1)
        if self.image[row][column] == 1
          blur_points.append([row, column])
        end
        column = column + 1
      end
      row = row + 1
    end
    return blur_points
  end

  def valid_coordinates(row, column)
    if ((row >= 0 && row <= row_size - 1) && (column >= 0 && column <= column_size - 1))
      true
    else
      false
    end
  end

end

image = Image.new([
  [1, 0, 0, 1],
  [0, 0, 1, 0],
  [0, 0, 0, 0],
  [1, 0, 0, 1] 
])

image2 = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

image3 = Image.new([
  [0, 0, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

image4 = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [1, 0, 0, 0],
  [0, 0, 0, 0]
])

image.output_image
puts "\n"
image.blur
image.output_image
puts "\n"

image2.output_image
puts "\n"
image2.blur
image2.output_image
puts "\n"

image3.output_image
puts "\n"
image3.blur
image3.output_image
puts "\n"

image4.output_image
puts "\n"
image4.blur
image4.output_image
puts "\n"

