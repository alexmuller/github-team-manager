require 'array_diff'

RSpec.describe ArrayDiff do
  it 'returns items which have been newly added' do
    diff = ArrayDiff.new([], ['foo'])
    expect(diff.additions).to eq ['foo']
  end

  it 'returns items which have been removed' do
    diff = ArrayDiff.new(['foo'], [])
    expect(diff.removals).to eq ['foo']
  end

  it 'returns a pretty diff of the changes' do
    diff = ArrayDiff.new(['foo', 'baz'], ['bar', 'baz'])
    COLOUR_REMOVAL = "\e[0;31;49m"
    COLOUR_ADDITION = "\e[0;32;49m"
    COLOUR_TERMINATOR = "\e[0m"
    expect(diff.pretty_print).to eq ["#{COLOUR_ADDITION}+ bar#{COLOUR_TERMINATOR}", "  baz", "#{COLOUR_REMOVAL}- foo#{COLOUR_TERMINATOR}"]
  end
end
