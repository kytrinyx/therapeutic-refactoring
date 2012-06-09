require_relative './xyz_file'

module XYZService

  def self.xyz_filename(target)
    XYZFile.new(target).name
  end

end
