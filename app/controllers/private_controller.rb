class PrivateController < ApplicationController
  before_filter :authenticate!
end
