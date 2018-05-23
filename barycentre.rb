

#class Barycentre
	include Math

	def rad2degr(rad)
		return rad * 180 / Math::PI
	end

	def degr2rad(degr)
		return degr * Math::PI / 180
	end

	def get_lat_lng_center(lat_lng_in_degr)
		latidx = 0;
		lngidx = 1;
		sum_x = 0;
		sum_y = 0;
		sum_z = 0;
	
		lat_lng_in_degr.count.times do |i|
			lat = degr2rad(lat_lng_in_degr[i][latidx])
			lng = degr2rad(lat_lng_in_degr[i][lngidx])
			sum_x += Math.cos(lat) * Math.cos(lng)
			sum_y += Math.cos(lat) * Math.sin(lng)
			sum_z += Math.sin(lat)
		end

		avg_x = sum_x / lat_lng_in_degr.count
		avg_y = sum_y / lat_lng_in_degr.count
		avg_z = sum_z / lat_lng_in_degr.count

		lng = Math.atan2(avg_y, avg_x)
		hyp = Math.sqrt(avg_x * avg_x + avg_y * avg_y)
		lat = Math.atan2(avg_z, hyp)

		return [rad2degr(lat), rad2degr(lng)]
	end

	def calculate_user_barycenter

		puts "How many friends are meeting my friend?"
		n = gets
		@geo = Array.new(n.to_i) { Array.new(2) }
		n.to_i.times do |i| 
			puts "What is your latitude n°#{i} my friend?"
			@geo[i][0] = gets.to_f
			puts "What is your longtitude n°#{i} my friend?"
			@geo[i][1] = gets.to_f

		end

	end

	calculate_user_barycenter
	puts get_lat_lng_center(@geo)



	#end


	# v = get_lat_lng_center([[48.8944842,2.3186404],[48.8829793,2.3482052],[48.8435817,2.2990845]])
	# puts v


#end

=begin

 @param latLngInDeg array of arrays with latitude and longtitude
 *   pairs in degrees. e.g. [[latitude1, longtitude1], [latitude2
 *   [longtitude2] ...]
 *
 * @return array with the center latitude longtitude pairs in 
 *   degrees.

###################### JS FUNCTION #######################

function rad2degr(rad) { return rad * 180 / Math.PI; }

function degr2rad(degr) { return degr * Math.PI / 180; }


function getLatLngCenter(latLngInDegr) {
    var LATIDX = 0;
    var LNGIDX = 1;
    var sumX = 0;
    var sumY = 0;
    var sumZ = 0;

    for (var i=0; i<latLngInDegr.length; i++) {
        var lat = degr2rad(latLngInDegr[i][LATIDX]);
        var lng = degr2rad(latLngInDegr[i][LNGIDX]);
        // sum of cartesian coordinates
        sumX += Math.cos(lat) * Math.cos(lng);
        sumY += Math.cos(lat) * Math.sin(lng);
        sumZ += Math.sin(lat);
    }

    var avgX = sumX / latLngInDegr.length;
    var avgY = sumY / latLngInDegr.length;
    var avgZ = sumZ / latLngInDegr.length;

    // convert average x, y, z coordinate to latitude and longtitude
    var lng = Math.atan2(avgY, avgX);
    var hyp = Math.sqrt(avgX * avgX + avgY * avgY);
    var lat = Math.atan2(avgZ, hyp);

    return ([rad2degr(lat), rad2degr(lng)]);
}

=end
