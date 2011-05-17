class StreamController < ApplicationController
  def index
    self.response_body = proc {|response, output|
          @interior_fragment = render_to_string(:partial => 'fragment', :layout => false)
          output.write(render_to_string(:layout => "generalized"))
          result = render_to_string(:layout => "pagelet")
          # sleep 0.2
          output.write(result)
          output.write(render_to_string(:layout => "generalized_finish"))
          output.finish
      }
  end
end