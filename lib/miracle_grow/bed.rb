module MiracleGrow

  class Bed
    class << self
      ENV['HOST'] ||= "http://plantingseason.tk"

      def find_bed(id)
        response = Faraday.get("#{ENV["HOST"]}/api/v1/beds/#{id}")
        JSON.parse(response.body)
      end

      def create_bed(params)
        Faraday.post("#{ENV["HOST"]}/api/v1/beds") do |req|
          request = params
          req.body = params
        end
      end

      def patch_bed(params)
        Faraday.put("#{ENV["HOST"]}/api/v1/beds/#{(params[:id])}") do |req|
          request = params
          req.body = params
        end
      end

      def current_users_beds(uid)
        response = Faraday.get("#{ENV["HOST"]}/api/v1/beds/for_user/#{uid}")
        JSON.parse(response.body)
      end

      def default_bed(uid)
        response = Faraday.get("#{ENV["HOST"]}/api/v1/beds/default_for_user/#{uid}")
        JSON.parse(response.body)
      end

      def show_bed(id)
        response = Faraday.get("#{ENV["HOST"]}/api/v1/beds/#{id}")
        JSON.parse(response.body)
      end

      def find_neighbors(bed, uid)
        beds = current_users_beds(uid)
        if beds.length > 0
          i = beds.index(bed)
          if beds[i + 1]
            nxt = beds[i + 1]
          else
            nxt = beds[0]
          end

          if beds[i-1]
            prev = beds[i - 1]
          else
            prev = beds[-1]
          end
        end
        [nxt, prev]
      end

    end
  end
end
