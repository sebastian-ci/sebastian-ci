class RepositoriesController < PrivateController
  def index
    @repositories = current_user.repositories
  end

  def create
    @repository = current_user.link_repository("#{params[:owner_name]}/#{params[:name]}")

    redirect_to repository_path(@repository)
  end

  def show
    @repository = repository_from_path
  end

  def status
    headers['Expires'] = CGI.rfc1123_date(Time.now.utc)

    @repository = repository_from_path

    result = case @repository.last_build_status
    when 0
      'red'
    when 1
      'green'
    else
      'grey'
    end

    path = Rails.root.join('public','result',"#{result}.gif")
    send_file(path, :type => 'image/gif', :disposition => 'inline')
  end
end
