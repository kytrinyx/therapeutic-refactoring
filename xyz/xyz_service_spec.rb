require_relative './xyz_service'

describe XYZService do

  subject { XYZService.xyz_filename(stub) }

  it 'works' do
    subject.should eq('something')
  end

end
