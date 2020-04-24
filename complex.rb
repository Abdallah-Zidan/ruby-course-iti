class ComplexNumber

    @@add_operations=0
    @@multiply_operations=0

    attr_accessor :real , :imaginary
 
    def initialize (real=0,imaginary=0)
        @real = real
        @imaginary=imaginary 
    end

    def +(comp)
        @@add_operations += 1;
        return ComplexNumber.new(self.real+comp.real , self.imaginary + comp.imaginary)
       
    end

    def *(comp)
        @@multiply_operations += 1
        return ComplexNumber.new(self.real*comp.real-self.imaginary * comp.imaginary ,
             self.real*comp.imaginary+self.imaginary*comp.real)
    end

    def self.bulk_add(comps)
        sum = comps.first;
        comps.drop(1).each do |comp|
            sum = sum+comp
        end
        return sum;
    end

    def self.bulk_multipy(comps)
        product = comps.first;
        comps.drop(1).each do |comp|
            product=product*comp
        end
        return product
    end

    def self.get_stats()
        return "\nNumber of addition operations : #{@@add_operations}\nNumber of multiplication operations : #{@@multiply_operations}\n"   
    end

    def to_s
        return "#{self.real} + #{self.imaginary}i"
        
    end

end


comp1 = ComplexNumber.new(3,2)
comp2 = ComplexNumber.new(1,7)

comp3 = comp1+comp2
comp4 = comp1*comp2
puts comp3
puts comp4

res=ComplexNumber.bulk_add([comp1,comp2,comp3])
puts res

res2 = ComplexNumber.bulk_multipy([comp1,comp2,comp4])
puts res2
puts ComplexNumber.get_stats()
  