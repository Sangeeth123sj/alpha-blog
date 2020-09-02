class ArticlesController < ApplicationController

def show

 	@article = Article.find(params[:id])
 	 
end


def create 
	@article = Article.new(params.require(:article).permit(:title, :description))

#	render plain: @article.inspect
	if @article.save
		redirect_to article_path(@article)

	else
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
	@article = Article.find(params[:id])
	@article.destroy
	redirect_to articles_path
end

def update
	@article  = Article.find(params[:id])
	@article = Article.new(params.require(:article).permit(:title, :description))
	@article.save
	redirect_to articles_path
end

end
