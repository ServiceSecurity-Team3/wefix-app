# frozen_string_literal: true

require 'roda'

module Wefix
  # Web controller for Wefix API
  class App < Roda
    route('problems') do |routing|
      routing.on do
        # GET /problems/
        routing.get(String) do |doc_id|
          if @current_user.logged_in?
            prob_info = GetProblem.new(App.config)
                                  .call(@current_user, doc_id)
            # puts "PROB: #{prob_info}"
            problem = Problem.new(prob_info)

            view :problem, locals: {
              current_user: @current_user, problem: problem
            }
          else
            routing.redirect '/auth/login'
          end
        end
      end
    end
  end
end