class CsvRow
    attr_accessor :data

    def initialize(parentCsv, data)
        @parent = parentCsv
        @data = data
    end

    def method_missing name
        index = @parent.headers.index(name.to_s)
        index ? data[index] : nil # maybe raise an error?
    end
end

module ActsAsCsv

    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end
    end

    module InstanceMethods

        def read
            @csv_contents = []
            filename = self.class.to_s.downcase + '.txt'
            file = File.new(self.class.to_s.downcase + '.txt')
            @headers = file.gets.chomp.split(', ')

            file.each do |row|
                @csv_contents << row.chomp.split(', ')
            end
        end

        attr_accessor :headers, :csv_contents

        def initialize
            read
        end

        def each(&block)
            self.csv_contents.map {|data| block.call CsvRow.new(self, data)}
        end

    end
end

class RubyCsv
    include ActsAsCsv
    acts_as_csv
end

'''
Modify the CSV application to support an each method to return a CsvRow object.
Use method_missing on that CsvRow to return the value for the column for a given
heading.
'''

csv = RubyCsv.new
puts csv.headers.inspect # ["animal", "color"]
puts csv.csv_contents.inspect # [["lion", "yellow"], ["tiger", "orange"], ...]

# Step 1: Implement a CsvRow class
entry = CsvRow.new(csv, ["parrot", "green"])
puts entry.animal # parrot

# Step 2: Implement each method for RubyCsv
csv.each {|entry| puts entry.animal} # "lions\n\tiger\seal"
