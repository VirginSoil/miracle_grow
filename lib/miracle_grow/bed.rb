module MiracleGrow

  class Bed
    class << self

      def find_bed(id)
        response = Faraday.get("http://localhost:8080/api/v1/beds/#{id}")
        JSON.parse(response.body)
      end

      def create_bed(params)
        Faraday.post('http://localhost:8080/api/v1/beds') do |req|
          request = params
          req.body = params
        end
      end

      def patch_bed(params)
        Faraday.put("http://localhost:8080/api/v1/beds/#{(params[:id])}") do |req|
          request = params
          req.body = params
        end
      end

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

      def find_neighbors(bed)
        if current_users_beds.length > 0
          i = current_users_beds.index(bed)
          if current_users_beds[i + 1]
            nxt = current_users_beds[i + 1]
          else
            nxt = current_users_beds[0]
          end

          if current_users_beds[i-1]
            prev = current_users_beds[i - 1]
          else
            prev = current_users_beds[-1]
          end
        end
        [nxt, prev]
      end

    end
  end
end