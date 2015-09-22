describe Spree::ErrorSerializer do
  let(:address_errors) do
    [
      {
        "ship_address.firstname": ["can't be blank"],
        "ship_address.lastname": ["can't be blank"]
      },
      {
        "bill_address.firstname": ["can't be blank"],
        "bill_address.lastname": ["can't be blank"]
      }
    ]
  end

  subject { described_class }

  describe '#as_json' do
    before do
      @store = build(:store, code: nil, mail_from_address: nil)
      @store.save
    end

    it 'will format json to json api spec' do
      expect(described_class.new(@store).as_json).to be_json_eql <<-JSON
        {
          "errors": [
            {
              "title": "Code",
              "meta": {},
              "pointer": "data/attributes/code",
              "detail": "can't be blank"
            },
            {
              "title": "Mail From Address",
              "meta": {},
              "pointer": "data/attributes/mail_from_address",
              "detail": "can't be blank"
            }
          ]
        }
      JSON
    end

    it 'will format options as meta' do
      expect(described_class.new(@store, example: :content).as_json).to be_json_eql <<-JSON
        {
          "errors": [
            {
              "detail": "can't be blank",
              "meta": {
                "example": "content"
              },
              "pointer": "data/attributes/code",
              "title": "Code"
            },
            {
              "detail": "can't be blank",
              "meta": {
                "example": "content"
              },
              "pointer": "data/attributes/mail_from_address",
              "title": "Mail From Address"
            }
          ]
        }
      JSON
    end

    it 'will format a symbol' do
      expect(described_class.new(:invalid_token).as_json).to be_json_eql <<-JSON
        {
          "errors": [
            {
              "detail": "#{Spree.t('api.errors.invalid_token.detail')}",
              "meta": {},
              "title": "#{Spree.t('api.errors.invalid_token.title')}"
            }
          ]
        }
      JSON
    end

    it 'will format an array of errors' do
      expect(described_class.new(address_errors).as_json).to be_json_eql <<-JSON
        {
          "errors" : [
            {
              "detail" : "can't be blank",
              "meta" : {},
              "pointer" : "data/attributes/ship_address/firstname",
              "title" : "Ship Address Firstname"
            },
            {
              "detail" : "can't be blank",
              "meta" : {},
              "pointer" : "data/attributes/ship_address/lastname",
              "title" : "Ship Address Lastname"
            },
            {
              "detail" : "can't be blank",
              "meta" : {},
              "pointer" : "data/attributes/bill_address/firstname",
              "title" : "Bill Address Firstname"
            },
            {
              "detail" : "can't be blank",
              "meta" : {},
              "pointer" : "data/attributes/bill_address/lastname",
              "title" : "Bill Address Lastname"
            }
          ]
        }
      JSON
    end
  end
end
