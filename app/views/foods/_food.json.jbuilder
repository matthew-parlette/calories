json.extract! food, :id, :name, :unit_of_measure, :calories, :default, :hidden, :created_at, :updated_at
json.url food_url(food, format: :json)
