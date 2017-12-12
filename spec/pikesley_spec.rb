describe '/' do
  it 'has the correct title' do
    expect(subject).to contain """
    <title>
    sam.pikesley.org
    </title>
    """
  end
end

describe '/cv/' do
  it 'has the correct title' do
    expect(subject).to contain """
    My CV
    """
  end
end
