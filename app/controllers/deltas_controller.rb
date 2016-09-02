class DeltasController < ApplicationController
  def index
    @entries = Entry.all
  end
end
