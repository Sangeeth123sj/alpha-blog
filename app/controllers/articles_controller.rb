class ArticlesController < ApplicationController

before_action :set_article, only: [:show, :edit, :update, :destroy]


def show
end


def create 
	@article = Article.new(set_params)

#	render plain: @article.inspect
	if @article.save
		flash[:notice] = "Article was created succesfully."
		redirect_to article_path(@article)


	else
		flash[:notice] = "Article was not created succesfully."
		render 'new'
	end 

end

def new
	@article = Article.new
end

def index
	@articles = Article.all
end

def destroy
	
	@article.destroy
	redirect_to articles_path
end

def edit
	
end

def update
	
#	@article = Article.new
	if @article.update(set_params)
		flash[:notice] = "Article edited successfully."
		redirect_to @article
	else
		render 'edit'
	end
end

private

def set_article
	@article = Article.find(params[:id])
end

def set_params
	params.require(:article).permit(:title, :descritpion)
end


end
