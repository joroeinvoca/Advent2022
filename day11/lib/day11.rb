
class Day11
  def self.monkey_business_level(file)
    monkey_items = {}
    monkey_op = {}
    monkey_test = {}

    total_cycles = 20

    File.open(file).each_slice(7) do |chunk|
      chunk.map!(&:chomp)
      # get monkey number
      monkey = chunk[0].partition(' ')[2].delete(':').to_i
      # populate monkey items
      monkey_items[monkey] = chunk[1].partition(':')[2].split(', ').map!(&:strip).map!(&:to_i)
      # populate monkey rules
      monkey_op[monkey] = chunk[2].partition(':')[2].split(' ')
      monkey_op[monkey][4] = monkey_op[monkey][4].to_i
      # populate monkey test
      div = chunk[3].partition(':')[2].split(' ')[2].to_i
      if_t = chunk[4].partition(":")[2].split(' ')[3].to_i
      if_f = chunk[5].partition(":")[2].split(' ')[3].to_i
      monkey_test[monkey] = [div, if_t, if_f]
    end

    # figure out where item goes
    current_monkey = 0
    total_cycles.downto(1) do
      while current_monkey <= monkey_items.keys.max
        # Monkey inspects an item
        current_item = monkey_items[current_monkey].shift
        # monkey_op changes worry level
        current_item = current_item.method(monkey_op[current_monkey][3]).(monkey_op[current_monkey][4])
        # Worry level is divided by 3 (and rounded down)
        current_item = (current_item / 3).to_i
        # eval rule, item (with new worry level) passed to true or false monkey (to end of list)
        if current_item % monkey_test[current_monkey][0] == 0
          monkey_items[monkey_test[current_monkey][1]].push(current_item)
        else
          monkey_items[monkey_test[current_monkey][2]].push(current_item)
        end
        if monkey_items[current_monkey].size < 1
          current_monkey += 1
        end
      end
    end


    # multiply top 2 quantities of items inspected
    puts 'end'
  end
end
