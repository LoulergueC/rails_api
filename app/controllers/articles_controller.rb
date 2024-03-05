class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[ create update destroy ]
  before_action :set_article, only: %i[ show update destroy ]
  before_action :only_the_owner, only: %i[ update destroy ]
  before_action :is_private?, only: %i[ show ]

  # GET /articles
  def index
    @articles = Article.all.where(private: false)

    render json: @articles
  end

  # GET /articles/1
  def show
    render json: @article
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article, status: :created, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    def only_the_owner
      if @article.user != current_user
        render json: { message: 'You are not authorized to perform this action.' }, status: :unauthorized
      end
    end

    def is_private?
      if @article.private && @article.user != current_user
        render json: { message: 'This article is private.' }, status: :unauthorized
      end
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content, :private)
    end
end
