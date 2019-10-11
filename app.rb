require 'pry'
class Building
    attr_reader :address, :number_of_floors
    attr_accessor :name, :tenants
    @@all = []

    def initialize(name, address, floors, tenants)
        @name = name
        @address = address
        @number_of_floors = floors
        @tenants = tenants
        @@all << self
    end
    
    def self.all
        @@all
    end

    def self.avg_tenants
        all.map{|building| building.tenants }.reduce(:+) / all.size
    end
    
    def placard
        "#{name}, #{address}"
    end

    def tenants_floor
        tenants / number_of_floors
    end
end

the_hub = Building.new("The Hub", "3601 Walnut Street", 8, 1000)
fusion_factory = Building.new("The Fusion Factory", "3563 Walnut St", 1, 10)
sharing_caring = Building.new("Sharing & Caring Ministries", "3742 N Downing St", 1, 80)
a = Building.avg_tenants
b = the_hub.placard
c = the_hub.tenants_floor

binding.pry
0