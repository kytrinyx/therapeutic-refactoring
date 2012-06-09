require_relative './xyz_service'

describe XYZService do

  let(:target) do
    stub(:target)
  end

  subject { XYZService.xyz_filename(target) }

  it 'works' do
    subject.should eq('something')
  end

end
