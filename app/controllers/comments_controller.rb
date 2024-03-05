class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[ create update destroy ]
  before_action :set_comment, only: %i[ show update destroy ]
  before_action :only_the_owner, only: %i[ update destroy ]
  before_action :is_private?, only: %i[ index, show ]

  # GET /comments
  def index
    @comments = Article.find(params[:article_id]).comments

    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params, user: current_user, article: Article.find(params[:article_id]))

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.all.where(article_id: params[:article_id])[params[:id].to_i - 1]
    end

    def only_the_owner
      if @comment.user != current_user
        render json: { message: 'You are not authorized to perform this action.' }, status: :unauthorized
      end
    end

    def is_private?
      if Article.find(params[:article_id]).private
        render json: { message: 'This comment is associated with a private article.' }, status: :unauthorized
      end
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:title, :content)
    end
end
