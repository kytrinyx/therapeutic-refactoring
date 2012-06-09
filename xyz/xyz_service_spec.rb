require_relative './xyz_service'
require 'digest'
require 'date'

describe XYZService do

  let(:target) do
    messages = {
      :publish_on => Date.new(2012, 3, 14),
      :xyz_category_prefix => 'abc',
      :kind => 'unicorn',
      :personal? => false,
      :id => 1337,
      :title => 'magic & superglue'
    }
    stub(:target, messages)
  end

  subject { XYZService.xyz_filename(target) }

  it 'works' do
    subject.should match(/14abcunicorn_1337_[0-9a-f]{8}_magicsuper\.jpg/)
  end

end
