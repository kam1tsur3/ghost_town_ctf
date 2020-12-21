class ApplicationController < ActionController::Base
    def hello
        render html: "hello, km23"
    end
end