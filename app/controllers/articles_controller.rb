class ArticlesController < ApplicationController

def show

 	@article = Article.find(params[:id])
 	 
end


def create 
	@article = Article.new(params.require(:article).permit(:title, :description))

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
	@article = Article.find(params[:id])
	@article.destroy
	redirect_to articles_path
end

def edit
	@article = Article.find(params[:id])
end

def update
	@article = Article.find(params[:id])
#	@article = Article.new
	if @article.update(params.require(:article).permit(:title, :description))
		flash[:notice] = "Article edited successfully."
		redirect_to @article
	else
		render 'edit'
	end
end

end
