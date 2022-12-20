require 'rails_helper'

RSpec.describe Bowl, type: :mvc_type do
  describe '#.description' do
    it "is exepcted to return 'this is average'" do
      expect(value).to eq(expected_result)
    end
  end
end
