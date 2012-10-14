class BuildsController < PrivateController
  before_filter :get_repository

  def index
    @builds = @repository.builds
  end

  def show
    @build = @repository.builds

    @build = if params[:id]
      @build.find(params[:id])
    else
      @build.last
    end
  end

  private

  def get_repository
    @repository = repository_from_path
  end
end
