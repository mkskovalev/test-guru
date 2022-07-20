module TestsHelper

  def question_header(action, test)
    case action
    when :create
      "Create New #{test.title} Question"
    when :edit
      "Edit #{test.title} Question"
    end
  end

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

end
