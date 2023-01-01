
class Day16
  def self.max_pressure_to_release(file, minutes=30)
    valve_flow = {}
    valve_map = {}
    routes = []

    File.foreach(file, chomp: true) do |line|
      # valve
      valve_name = line[line.index(' ') + 1 .. line.index(' ') + 2]
      flow_rate = line[line.index('rate=') + 5 .. line.index(';') - 1].to_i
      valve_flow[valve_name] = flow_rate

      # tunnels
      raw_tunnels = line.partition(/(to valve)s*/)[2]
      tunnels = raw_tunnels.strip!.split(',').map(&:strip)
      valve_map[valve_name] = tunnels
    end


    #
    # [ [starting_point, min1, min2, min3, ... value] ]
    # 'AA' is off
    # 'AA1'
    #
    # from 1 .. 30, for each current "route"
    # if state of valves_visited.last is 0 && valves_visited.last flow rate is > 0
    # duplicate, open valve in one scenario, check tunnels in other
    # in tunnel-check, duplicate for number of tunnels, take 1 tunnel in each
    # next minute

    routes[0] = ['AA'].fill(2, minutes - 1) { nil }
    routes[0] << 0

    useful_valves = valve_flow.filter { |valve, flow| flow > 0 }.keys.map! { |valve| valve + '1' }

    for min in 1 .. minutes
      puts "minute: #{min}"
      puts "routes: #{routes.size}"

      # get rid of bum routes
      routes.delete_if do |route_to_check|
        route_to_check.include?('$')
      end

      # eventually, just drop the worst routes
      if min > 5
        cutoff = routes.map(&:last).min(routes.count * 0.6).last
        routes.delete_if do |route_to_delete|
          route_to_delete.last < cutoff
        end
      end

      routes.each_with_index do |route, i|
        # don't reprocess new routes that have this minute already done
        if !route[min].nil?
          next
        else
          # add pressure from current minute if we need to process this one still
          routes[i][-1] = recalc_pressure(valve_flow, route)
        end

        # get rid of routes that just bounce between valves
        if min > 3
          if route[min - 1] == route[min - 3] && route[min - 2] == route[min - 4]
            route[min] = '$'
            next
          end
        end

        current_valve = route[min - 1][0, 2]
        # if current_valve is off and current_valve's flow is > 0, try turning it on
        if !route.include?(current_valve + '1') && valve_flow[current_valve] > 0
          new_route = route.map(&:clone)
          new_route[min] = current_valve + '1'
          #new_route[-1] = recalc_pressure(valve_flow, new_route)
          routes << new_route
        end

        # see how many tunnel options there are, try them all
        # but not if they go to an already-on dead end
        valve_map[current_valve].each_with_index do |tunnel, ind|
          if valve_map[tunnel].size == 1 && valve_map[tunnel][0] == current_valve && (route.include?(tunnel + '1') || valve_flow[tunnel] == 0)
            # skip this one from now on
            route[min] = '$'
            next
          end
          if ind < valve_map[current_valve].size - 1
            new_route = route.map(&:clone)
            new_route[min] = tunnel
            #new_route[-1] = recalc_pressure(valve_flow, new_route)
            routes << new_route
          else
            routes[i][min] = tunnel
            #routes[i][-1] = recalc_pressure(valve_flow, route)
          end
        end
      end
    end

    routes.map(&:last).max
  end

  def self.recalc_pressure(valve_flow, route)
    new_pressure = route[-1]

    for i in 0 .. route.size - 2
      if route[i].nil?
        next
      elsif route[i].length == 3
        new_pressure += valve_flow[route[i][0, 2]]
      end
    end
    new_pressure
  end
end
