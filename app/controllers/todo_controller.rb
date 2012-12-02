class TodoController < ApplicationController

      bofore_filter :authenticate_user! 
      def create
          task = currrent_user.task.find(params[:id])
          current_user.schdule.todos.create(:task_id => task.id)
          redirect_to (:controller => "today",:action => "index")
      end

      def destroy
          todo = current_user.todo.find(params[:id])
          current_user.schedule.todos.delete(todo)
          redirect_to (:controller => "today", :action => "index")
      end

end
