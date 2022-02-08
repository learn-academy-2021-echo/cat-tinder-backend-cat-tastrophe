require 'rails_helper'

RSpec.describe "Cat", type: :request do
  describe "GET /index" do
    it "gets a list of cats" do
      Cat.create(
        name: "Jack",
        age: 5,
        enjoys: "Furrrrociously hunting bugs.",
        image: "https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80"
      )

      # Make a request
      get '/cats'

      cat = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1
    end
  end
  it "doesn't create a cat without a name" do
  cat_params = {
    cat: {
      age: 2,
      enjoys: 'Walks in the park',
      image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
    }
  }

  post '/cats', params: cat_params
  expect(response.status).to eq 422
  json = JSON.parse(response.body)
  expect(json['name']).to include "can't be blank"
end
end



describe "POST /create" do
  it "creates a cat" do
    cat_params = {
      cat: {
        name: "Homer",
        age: 12,
        enjoys: "Food mostly, really just food.",
        image: "https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80"
      }
    }

    post '/cats', params: cat_params

    expect(response).to have_http_status(200)

    cat = Cat.first

    expect(cat.name).to eq 'Homer'
  end
end
