class TodosController < ApplicationController
  before_action :set_todo, only: [:category, :show, :edit, :update, :destroy]

  # GET /todos
  def index
    @statuses = params[:statuses] || session[:statuses] || {}
    @orderDir = params[:orderDir] || session[:orderDir]
    @orderBy = params[:orderBy] || session[:orderBy]

    @all_statuses = Todo.all_statuses
      
    if @statuses == {}
      # Map statusus array to Hash -- https://stackoverflow.com/a/30887585
      @statuses = @all_statuses.to_h { |s| [s, 1] }
    end
      
    if params[:statuses] != session[:statuses] ||
       params[:orderBy] != session[:orderBy] ||
       params[:orderDir] != session[:orderDir]
     session[:statuses] = @statuses
     session[:orderBy] = @orderBy
     session[:orderDir] = @orderDir
     redirect_to todos_path(statuses: @statuses, orderBy: @orderBy, orderDir: @orderDir) and return
    end
      
    @statuses_to_show = @statuses.keys
    @todos = Todo.with_status(@statuses_to_show)
    
    if !@orderBy.nil?
      # Order todos by the value of the `orderBy` param and in either asc./desc. order
      @todos = @todos.order(@orderBy => (@orderDir == 'desc') ? :desc : :asc)
    end
  end
    
  def category
    @same_category = Todo.where_category(@todo.category)

    if @same_category.nil?
      redirect_to todos_path, notice: 'Todo has no category.'
    end
  end

  # GET /todos/1
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to @todo, notice: 'Todo was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /todos/1
  def update
    if @todo.update(todo_params)
      redirect_to @todo, notice: 'Todo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
    redirect_to todos_url, notice: 'Todo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def todo_params
      params.require(:todo).permit(:title, :description, :category, :status, :due_date)
    end
end
