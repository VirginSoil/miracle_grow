module MiracleGrow
  class Plant
    class << self

      def current_users_beds(uid)
        response = Faraday.get("http://localhost:8080/api/v1/beds/for_user/#{uid}")
        JSON.parse(response.body)
      end

      def default_bed(uid)
        response = Faraday.get("http://localhost:8080/api/v1/beds/default_for_user/#{uid}")
        JSON.parse(response.body)
      end

      def show_bed(id)
        response = Faraday.get("http://localhost:8080/api/v1/beds/#{id}")
        JSON.parse(response.body)
      end

      def all_the_plants
        response = Faraday.get("http://localhost:8080/api/v1/plants")
        JSON.parse(response.body)
      end

      def all_plant_names
        all_the_plants.map {|plant| plant["name"] }
      end

      def plantings_for_bed(bed)
        response = Faraday.get("http://localhost:8080/api/v1/plantings/for_bed/#{bed['id']}")
        plantings = JSON.parse(response.body)
      end

      def taken(bed)
        plantings_for_bed(bed).map do |planting|
          [planting["x_coord"].to_s, planting["y_coord"].to_s, planting["slug"].to_s]
        end
      end

      def find_neighbors(bed)
        if current_users_beds.length > 0
          i = current_users_beds.index(bed)
          if current_users_beds[i + 1]
            @next = current_users_beds[i + 1]
          else
            @next = current_users_beds[0]
          end

          if current_users_beds[i-1]
            @prev = current_users_beds[i - 1]
          else
            @prev = current_users_beds[-1]
          end
        end
        [@next, @prev]
      end
    end
  end
end