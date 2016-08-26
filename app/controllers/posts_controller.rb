class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  include Swagger::Blocks

  swagger_path '/posts/{id}' do
    operation :get do
      key :description, 'Returns a single post if the user has access'
      key :operationId, 'findPostbyId'
      key :tags, [
        'post'
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of post to fetch'
        key :required, true
        key :type, :integer
        key :format, :int64
      end
      response 200 do
        key :description, 'post response'
      end
      response :default do
        key :description, 'unexpected error'
      end
    end
  end

  swagger_path '/posts' do
    operation :get do
      key :description, 'Returns all posts from the system that the user has access to'
      key :operationId, 'findPosts'
      key :produces, [
        'application/json'
      ]
      key :tags, [
        'post'
      ]

      response 200 do
        key :description, 'post response'
      end
      response :default do
        key :description, 'unexpected error'
      end
    end
    operation :post do
      key :description, 'Creates a new post'
      key :operationId, 'addPost'
      key :produces, [
        'application/json'
      ]
      key :tags, [
        'post'
      ]
      parameter do
        key :name, :title
        key :in, :formData
        key :description, 'Post title'
        key :type, :string
        key :required, true
      end

      parameter do
        key :name, :body
        key :in, :formData
        key :description, 'Content'
        key :type, :string
        key :required, true
      end

      response 200 do
        key :description, 'post response'
      end
      response :default do
        key :description, 'unexpected error'
      end
    end
  end

  # GET /posts
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
end
