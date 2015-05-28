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
end
