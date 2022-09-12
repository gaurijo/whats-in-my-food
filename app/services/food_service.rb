class FoodService
  def self.conn 
    Faraday.new("https://api.nal.usda.gov/fdc/v1/foods/search") do |faraday| #i was missing /search!!!
      faraday.params['api_key'] = ENV['food_api_key']
    end
  end

  def self.get_foods(ingredient)
    response = conn.get('?', {query: ingredient}) #changed 'list' to '?'
    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end
