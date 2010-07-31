require 'find'
require 'yaml'

module MeasureMe

  class Measurer
    attr_writer :here, :ignore, :interesting
    def initialize 
      @total_size = 0
      @here = Dir.pwd
      @ignore = %w{db test config log public vendor lib}
      @interesting = %w{class def module send method_missing superclass instance_methods ancestors include extend load const_missing instance_variable_get instance_variable_set remove_instance_variable class_variable_get class_variable_set remove_class_variable const_get const_set remove_const remove_method instance_eval module_eval eval method_missing instance_variables methods public_methods private_methods singleton_methods class_variables constants included_modules private_instance_methods protected_instance_methods public_instance_methods}
      @good_stuff = {}
      @lines = 0
      @interesting.each {|i| @good_stuff[i] = 0 }
      @reg = Regexp.union(*@interesting)
    end

    def measure
      Find.find(@here) do |path|
        if FileTest.directory?(path)
          if File.basename(path)[0] == ?. || @ignore.detect() {|ign| ign == File.basename(path)}
            Find.prune   
          else
            next
          end
        else
          get_stats(path)
        end
      end
      puts @good_stuff.to_yaml
      print "Total lines: ",  @lines, "\n"
    end

    def get_stats(path)
      total_size += FileTest.size(path)
      IO.foreach(path) do |block| 
        @lines +=1
        if @reg.match(block)
          @good_stuff[$~[0]] += 1
        end
      end
    end
  end
end

m = MeasureMe::Measurer.new
m.measure
