class EmployeesController < ApplicationController
  def index
    @employee = Unirest.get('http://localhost:3001/api/v2/employees.json').body
  end

  def new
  end

  def show
    @employee = Unirest.get('http://localhost:3001/api/v2/employees/' + params[:id] + '.json').body
  end

  def create
    @employee = Unirest.post('http://localhost:3001/api/v2/employees.json',
      headers: {'Accept' => 'application/json'},
      parameters: {first_name: params[:first_name],
                   last_name: params[:last_name],
                   email: params[:email]}
      ).body
    redirect_to "/employees/#{@employee['id']}"
  end

  def edit
    @employee = Unirest.get('http://localhost:3001/api/v2/employees/' + params[:id] + '.json').body
  end

  def update
    @employee = Unirest.patch('http://localhost:3001/api/v2/employees/' + params[:id] + '.json',
      headers: {'Accept' => 'application/json'},
      parameters: {first_name: params[:first_name],
                 last_name: params[:last_name],
                 email: params[:email]
               }
    ).body
    redirect_to "/employees/#{@employee['id']}"
  end
end
