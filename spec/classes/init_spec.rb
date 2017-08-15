require 'spec_helper'
describe 'selenium_md_nexus' do
  context 'with default values for all parameters' do
    it { should contain_class('selenium_md_nexus') }
  end
end
