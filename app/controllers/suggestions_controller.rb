class SuggestionsController < ApplicationController

  def home
    @suggestions = TopicSuggestion.all.sort_by { |ts| -ts.points }
  end

  def new
    TopicSuggestion.create name: params['suggestion_name']
    redirect_to '/suggestions/home?success=1'
  end

  def details
    @suggestion = TopicSuggestion.find_by_id params[:id]
    unless @suggestion
      raise ActionController::RoutingError.new 'Not Found'
    end
  end

  def toggle_like
    @suggestion = TopicSuggestion.find_by_id params[:id]
    if @suggestion.likes.where(user: @logged_user).count == 0
      Like.create(user: @logged_user, topic_suggestion: @suggestion)
    else
      Like.where(user: @logged_user, topic_suggestion: @suggestion)[0].delete
    end
    redirect_to "/suggestions/#{params[:id]}"
  end

end
