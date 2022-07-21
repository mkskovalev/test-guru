module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'Max Kovalev', "https://github.com/#{author}/#{repo}"
  end
end
