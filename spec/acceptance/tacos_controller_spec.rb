require 'acceptance_helper'

resource 'Tacos', controller: TacosController do
  taco_response_keys = %w(created_at meat notes rice salsa id)

  before(:each) do
    header 'Accept', 'application/json'
    header 'Content-Type', 'application/json'
  end

  post '/tacos' do
    let(:meat) { 'chicken' }
    let(:notes) { 'no notes' }
    let(:salsa) { 'true' }
    let(:rice) { 'false' }
    let(:raw_post) { params.to_json }

    parameter :meat, 'Taco meat', required: true, 'Type' => 'String'
    parameter :salsa, 'Put salsa flag (default false)', required: false, 'Type' => 'Boolean'
    parameter :rice, 'Put rice flag (default false)', required: false, 'Type' => 'Boolean'
    parameter :notes, 'Taco order notes (default blank)', required: false, 'Type' => 'String'

    response_field :id, 'Order ID'
    response_field :meat, 'Taco meat'
    response_field :rice, 'Whether to put rice'
    response_field :salsa, 'Whether to put salse'
    response_field :notes, 'Order notes'
    response_field :created_at, 'Order'

    example_request 'Create new taco order' do
      expect(status).to eq(200)
      res = JSON.parse response_body
      expect(res.keys).to match_array taco_response_keys
    end
  end

  get '/tacos' do
    example_request 'Get tacos list' do
      expect(status).to eq(200)
      res = JSON.parse response_body
      expect(res.count).to eq 1
      expect(res.first.keys).to match_array taco_response_keys
    end
  end

  delete '/tacos/:id' do
    let(:id) { Taco.first.id.to_s }
    example_request 'Delete taco order' do
      expect(status).to eq(200)
      expect(Taco.count.zero?).to be true
    end
  end
end
