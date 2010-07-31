require 'find'
require 'yaml'

module MeasureMe

  class Measurer
    attr_writer :here, :ignore, :interesting
    def initialize 
      @total_size = 0
      @here = Dir.pwd
      @ignore = %w{db test config log public vendor}
      @interesting = %w{def send superclass instance_methods ancestors extend load const_missing instance_variable_get instance_variable_set remove_instance_variable class_variable_get class_variable_set remove_class_variable const_get const_set remove_const remove_method instance_eval module_eval eval method_missing instance_variables methods public_methods private_methods singleton_methods class_variables constants included_modules private_instance_methods protected_instance_methods public_instance_methods class module include }
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
      print "Character size: ", @total_size,"\n"
    end

    def get_stats(path)
      @total_size += FileTest.size(path)
      File.open(path, 'r').each {|l| @lines += 1}
      IO.foreach(path) do |block| 
        block.split(" ").each do |splinter|
          if @reg.match(splinter)
            @good_stuff[$~[0]] += 1
          end
        end
      end
    end
  end
end

m = MeasureMe::Measurer.new
m.measure
