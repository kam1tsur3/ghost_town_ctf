class ApplicationController < ActionController::Base
    def hello
        render html: "hello, km2"
    end
end