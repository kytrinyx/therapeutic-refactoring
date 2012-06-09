class XYZFile

  attr_reader :target
  def initialize(target)
    @target = target
  end

  def name
    filename = "#{target.publish_on.strftime("%d")}"
    filename << "#{target.xyz_category_prefix}"
    filename << "#{target.kind.gsub("_", "")}"
    filename << "_%03d" % (target.age || 0) if target.personal?
    filename << "_#{target.id.to_s}"
    filename << "_#{Digest::SHA1.hexdigest(rand(10000).to_s)[0,8]}"
    truncated_title = target.title.gsub(/[^\[a-z\]]/i, '').downcase
    truncate_to = truncated_title.length > 9 ? 9 : truncated_title.length
    filename << "_#{truncated_title[0..(truncate_to)]}"
    filename << ".jpg"
    return filename
  end

end
