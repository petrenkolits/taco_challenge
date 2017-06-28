class TacosController < ApplicationController
  render_interactions :index, :create, :destroy
end
