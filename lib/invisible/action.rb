module Invisible
  module Action
    include Rendering
    
    attr_reader :method, :request, :response, :params
    
    def initialize(method, &block)
      @method = method
      @block  = block
    end
    
    def prepare(request)
      @request  = request
      @response = Response.new
      @params   = @request.params.merge(@request.path_params)
      
      @request.pipeline.apply(self)
    end
    
    def call(env)
      instance_eval(&@block)
      @response.finish
    end
  end
end