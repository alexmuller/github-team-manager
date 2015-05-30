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

  describe '#has_differences?' do
    it 'returns true when the diff has differences' do
      diff = ArrayDiff.new(['foo'], ['bar'])
      expect(diff.has_differences?).to eq true
    end

    it 'returns false when the diff has no differences' do
      diff = ArrayDiff.new(['foo'], ['foo'])
      expect(diff.has_differences?).to eq false
    end
  end
end
