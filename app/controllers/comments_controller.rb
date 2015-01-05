class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    # @patient = Patient.new(patient_params)
    @comment = authenticate_user.comments.build(comment_params)
    if @comment.save
      flash[:notice] = "Comment Created successfully"
      flash[:color]= "valid"
      redirect_to(:controller => 'users', :action => 'index')
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
      render "new"
    end
  end

  def show
    @comments = Comment.all
  end
end

private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end