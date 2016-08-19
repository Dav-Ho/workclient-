class EmployeesController < ApplicationController
  def index
    @employee = Unirest.get('http://localhost:3001/api/v2/employees.json').body
  end

  def show
    @employee = Unirest.get('http://localhost:3001/api/v2/employees/' + params[:id] + '.json').body
  end

end
