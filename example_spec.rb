module Example
  def to_yaml
    already_tested
  end
end

class ExampleHolder
  include Example
end

describe "Example" do
  subject { ExampleHolder.new }

  it "should write to a given file" do
    subject.should_receive(:already_tested).and_return({ 'foo' => 'bar', 'baz' => 'bom' })

    p Object.methods.sort
    p subject.methods.sort - Object.methods

    subject.to_yaml
  end
end
