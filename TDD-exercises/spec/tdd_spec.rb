require 'tdd'

describe "my_uniq" do

  let(:array) { [1, 1, 2, 2, 3, 3, 3] }
  let(:uniq_array) { my_uniq(array.dup) }

  it "returns unique elements of the array" do
    expect(uniq_array).to eq([1,2,3])
  end
end

describe "#two_sum" do
  it "finds all indices of elements that sum to zero" do
    expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
  end
end

describe "my_transpose" do
  let(:array) { [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ] }

  let(:transposed_array) { my_transpose(array.dup) }

  it "converts the array's rows to colums" do
    expect(transposed_array).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
  end
end
