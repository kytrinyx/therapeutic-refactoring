require_relative './xyz_service'
require 'digest'
require 'date'

describe XYZService do

  let(:target) do
    messages = {
      :publish_on => Date.new(2012, 2, 7),
      :xyz_category_prefix => 'abc',
      :kind => 'magic_unicorn',
      :personal? => false,
      :id => 1337,
      :title => 'I <3 SPARKLY Sparkles!!1!'
    }
    stub(:target, messages)
  end

  subject { XYZService.xyz_filename(target) }

  it 'works' do
    subject.should match(/07abcmagicunicorn_1337_[0-9a-f]{8}_isparklysp\.jpg/)
  end

  it 'leaves square brackets' do
    target.stub(:title => 'i[sparkle]s')
    subject.should match(/07abcmagicunicorn_1337_[0-9a-f]{8}_i\[sparkle\]\.jpg/)
  end

  it 'personalizes' do
    target.stub(:personal? => true, :age => 42)
    subject.should match(/07abcmagicunicorn_042_1337_[0-9a-f]{8}_isparklysp\.jpg/)
  end

  it 'handles nil age' do
    target.stub(:personal? => true, :age => nil)
    subject.should match(/07abcmagicunicorn_000_1337_[0-9a-f]{8}_isparklysp\.jpg/)
  end

  it 'handles short titles' do
    target.stub(:title => 'O HAI')
    subject.should match(/07abcmagicunicorn_1337_[0-9a-f]{8}_ohai\.jpg/)
  end

end
