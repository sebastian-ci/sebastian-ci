class BuildsController < PrivateController
  before_filter :get_repository

  def index
    @builds = @repository.builds
  end

  def show
    @build = @repository.builds.find(params[:id])
  end

  private

  def get_repository
    @repository = repository_from_path
  end
end
