require 'test_helper'

class TopPageTest < ActionDispatch::IntegrationTest
  def setup
    @task = tasks(:task)
  end

  test "layout links" do
    get root_path
    assert_template "tasks/index"
  end

  test "successful edit" do
    get edit_task_path(@task)
    assert_template "tasks/edit"
    name = "Next task"
    patch task_path(@task),params: { task: {
      name: name
    }  }
    assert_redirected_to tasks_url
    @task.reload
    assert_equal name,@task.name
  end

  test "successful destroy" do
    assert_difference "Task.count",-1 do
        delete task_path(@task)
    end
    get root_url
  end



  test "post task" do
    get tasks_url
    assert_difference "Task.count",1 do
      post tasks_url,params: {task: {name: "New task"}}
    end
    follow_redirect!
    assert_template "tasks/index"
  end
end
