require 'securerandom'

module XYZService

  def self.xyz_filename(target)
    day =  target.publish_on.strftime('%d')
    category = target.xyz_category_prefix
    kind = target.kind.delete('_')
    
    age = '_%03i' % target.age.to_i if target.personal?
    noise = SecureRandom.hex(4)
    title = target.title.downcase.delete('^a-z[]')[0..9]
    
    "#{day}#{category}#{kind}#{age}_#{target.id}_#{noise}_#{title}.jpg"
  end

end
