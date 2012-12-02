class TaskController < ApplicationController
      before_filter :find_task,:except => [:index,:new,:create]
      before_filter :authenticate_user!
      def index
          @tasks = current_user.tasks
      end

      def new
          @task = Task.new
      end

      def create
          @task = current_user.tasks.build(params[:task])
          if @task.save!
             redirect_to(:controller => "today",:action => "index")
          else
             render :action => "new"
          end
      end

      def update
          @task.attributes = params[:task]
          @task.save!
          redirect_to :action => index
      end

      def destroy
          @task.destroy
          redirect_to :controller => "today",:action => "index"
      end
   
      def mark_complete
          if @task.complete.nil?
          @task.complete = Time.now
          else
             @task.complete = nil 
          end
          @task.save! 
          redirect_to :controller => "today" , :action => "index"
      end
     
      protected
      def find_task()
          @task = current_user.tasks.find(params[:id])
      end

end
