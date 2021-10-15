class ApplicationController < ActionController::Base
  def search(klass, singular, plural)
    query = params.permit(:query)[:query]

    if query.blank?
      redirect_to root_path and return
    end

    results = klass.search(query)
    case results.count
    when 0
      redirect_to root_path
    when 1
      redirect_to action: "show", id: results.first
    else
      instance_variable_set(plural, results)
      render "index"
    end
  end
end
