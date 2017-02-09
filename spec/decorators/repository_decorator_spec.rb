require 'spec_helper'

describe RepositoryDecorator do
  let(:repository) { Repository.new.extend RepositoryDecorator }
  subject { repository }
  it { should be_a Repository }
end
