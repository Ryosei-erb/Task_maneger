class TasksController < ApplicationController
  def index
    @q = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true)
    @task = Task.new
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    if task.save
      redirect_to tasks_url
    else
      render "index"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    redirect_to tasks_url
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url
  end

    private
      def task_params
        params.require(:task).permit(:name)
      end

end
