module TodayHelper

       def sidebar_tasks(name)
           tasklist = content_tag(:h1,"#{name.capitalize} Tasks")
           current_user.tasks.send(name) do |task|
               tasklist += link_to"Do Today",new_todo_path(task)
               tasklist += "#{task.name}"
               tasklist += link_to "Delete",task_path(task),:method => :delete
           end
       end

end
