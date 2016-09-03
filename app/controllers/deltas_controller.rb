class DeltasController < ApplicationController
  def index
    @entries = Entry.all.order day: :asc
    @balance = 0
  end
end
