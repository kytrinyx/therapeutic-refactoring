class XYZFile

  attr_reader :target
  def initialize(target)
    @target = target
  end

  def name
    filename = ""
    filename << prefix
    filename << "_#{age}" if target.personal?
    filename << "_#{target.id}"
    filename << "_#{noise}"
    filename << "_#{truncated_title}"
    "#{filename}.jpg"
  end

  def prefix
    [publication_day, category, kind].join
  end

  def publication_day
    target.publish_on.strftime("%d")
  end

  def category
    target.xyz_category_prefix
  end

  def kind
    target.kind.gsub("_", "")
  end

  def age
    "%03d" % (target.age || 0)
  end

  def noise
    Digest::SHA1.hexdigest(rand(10000).to_s)[0,8]
  end

  def truncated_title
    target.title.downcase.gsub(/[^\[a-z\]]/, '')[0..9]
  end

end
