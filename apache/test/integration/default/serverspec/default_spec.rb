require 'spec_helper'

describe 'apache::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  it 'is awesome' do
    expect(true).to eq true
  end

  it 'is installed' do
    expect(package('apache2')).to be_installed
  end

  it 'is running' do
    expect(service('apache2')).to be_running
  end

  it 'responds to an http request' do
    expect(command('curl http://localhost').exit_status).to eq 0
  end

end
