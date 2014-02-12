module MiracleGrow

  class Planting
    class << self

      def plantings_for_bed(id)
        response = Faraday.get("#{request.host}/api/v1/plantings/for_bed/#{id}")
        plantings = JSON.parse(response.body)
      end

      def taken(bed_id)
        plantings_for_bed(bed_id).map do |planting|
          [planting["x_coord"].to_s, planting["y_coord"].to_s, planting["slug"].to_s]
        end
      end

    end
  end
end