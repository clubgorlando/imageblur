class Image
  attr_accessor :image

  def initialize(image_data)
    self.image = Array.new {Array.new}
    self.image = image_data
  end

  def output_image
    self.image.each do |row|
      puts row.each { |image| image }.join()
    end

  end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0], 
])

image.output_image
