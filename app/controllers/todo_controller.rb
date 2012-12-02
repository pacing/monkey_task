class TodoController < ApplicationController

      before_filter :authenticate_user! 

      def create 
          task = current_user.tasks.find(params[:id])
          current_user.schedule.todos.create(:task_id => task.id)
          redirect_to :controller=>'today',:action => 'index'
      end

      def destroy
          todo = current_user.schedule.todos.find(params[:id])
          current_user.schedule.todos.delete(todo)
          redirect_to(:controller => "today",:action => "index")
      end

end
