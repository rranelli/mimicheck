module MimiCheck
  module Extensions
    def method_missing(name, *args, &block)
      if (match = name.to_s.match(/(.+)Gen$/))
        gen_name = match[1]
        gen_class = MimiCheck::Generator.const_get(gen_name)

        self.class.send :define_method, name do |*argx|
          gen_class.new(*argx)
        end

        send(name, *args)
      else
        super
      end
    end

    def respond_to_missing?(name, include_private = false)
      name.to_s.match(/(.+)Gen$/) || super
    end
  end
end
