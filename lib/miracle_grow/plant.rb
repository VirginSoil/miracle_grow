module MiracleGrow

  class Plant
    class << self
      ENV['HOST'] ||= "http://plantingseason.tk"

      def all_the_plants
        response = Faraday.get("#{ENV["HOST"]}/api/v1/plants")
        JSON.parse(response.body)
      end

      def all_plant_names
        all_the_plants.map {|plant| plant["name"] }
      end

    end
  end
end
