   class Dummy
     attr_reader :var
     def initialize
       @var = 99
       remove_instance_variable(:@var)
     end
   end
