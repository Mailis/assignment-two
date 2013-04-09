class CommentsController < ApplicationController
 
  http_basic_authenticate_with :name => "dhh", :password => "secret", :only => :destroy

  def create
    @post = Post.find(params[:post_id])
    
    #? snipped for brevity
    @comment = @post.comments.create(params[:comment])
     
    respond_to do |format|
      if @comment.save
        # Saada uue kommentaari teavituseks e-mail
        UserMailer.teavitus_email(@post, @comment).deliver
 
        format.html { redirect_to @post, notice: 'Kommentaar lisatud ja meil saadetud.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
    
    
    
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end
