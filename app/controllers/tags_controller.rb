class TagsController < ApplicationController
    class PostsController < ApplicationController
        before_action :set_tag, only: [:show, :edit, :update, :destroy]
      
        # GET /posts
        # GET /posts.json
        def index
          @tags = Tag.all
        end
      
        # GET /posts/1
        # GET /posts/1.json
        def show
        end
      
        # GET /posts/new
        def new
          @tag = Tag.new
        end
      
        def edit
        end
      
        # POST /posts
        # POST /posts.json
        def create
          @tag = Tag.new(post_params)
      
          respond_to do |format|
            if @tag.save
              format.html { redirect_to @tag, notice: 'tag was successfully created.' }
              format.json { render action: 'show', status: :created, location: @tag }
            else
              format.html { render action: 'new' }
              format.json { render json: @tag.errors, status: :unprocessable_entity }
            end
          end
        end
      
        # PATCH/PUT /posts/1
        # PATCH/PUT /posts/1.json
        def update
          respond_to do |format|
            if @tag.update(post_params)
              format.html { redirect_to @tag, notice: 'tag was successfully updated.' }
              format.json { head :no_content }
            else
              format.html { render action: 'edit' }
              format.json { render json: @tag.errors, status: :unprocessable_entity }
            end
          end
        end
      
        # DELETE /posts/1
        # DELETE /posts/1.json
        def destroy
          @tag.destroy
          respond_to do |format|
            format.html { redirect_to posts_url }
            format.json { head :no_content }
          end
        end
      
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_post
            @tag = Tag.find(params[:id])
          end
      
          # Never trust parameters from the scary internet, only allow the white list through.
          def post_params
            params.require(:tag).permit(:name)
          end
      end
      
end
