class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
    # cria uma nova instância sem salvar no banco de dados, ao contrário de .create
    # a nova instância não terá nenhuma info no começo
    # deixo o usuário preencher as infos
    # crio a nova task no banco de dados
  end

  def create
    @task = Task.new(task_params) # popula a nova instância com todos os parâmetros usando o método privado task_params
    @task.save # salva no banco de dados
    redirect_to tasks_path # executa o método #show
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
