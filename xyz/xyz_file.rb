class XYZFile

  attr_reader :target
  def initialize(target)
    @target = target
  end

  def name
    filename = "#{target.publish_on.strftime("%d")}"
    filename << "#{target.xyz_category_prefix}"
    filename << "#{target.kind.gsub("_", "")}"
    filename << "_#{age}" if target.personal?
    filename << "_#{target.id.to_s}"
    filename << "_#{noise}"
    filename << "_#{truncated_title}"
    filename << ".jpg"
    return filename
  end

  def truncated_title
    target.title.downcase.gsub(/[^\[a-z\]]/, '')[0..9]
  end

  def noise
    Digest::SHA1.hexdigest(rand(10000).to_s)[0,8]
  end

  def age
    "%03d" % (target.age || 0)
  end

end
