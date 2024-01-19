# spec/models/emp_spec.rb
require 'rails_helper'

RSpec.describe Emp, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to allow_value('valid@example.com').for(:email) }
    it { is_expected.not_to allow_value('invalid_email').for(:email) }

    it { is_expected.to validate_presence_of(:contact) }
    it { is_expected.to validate_length_of(:contact).is_at_least(10).is_at_most(15) }

    it { is_expected.to validate_presence_of(:address) }
  end
end
