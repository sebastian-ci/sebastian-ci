module ApplicationHelper
  def build_status_image(build, options = {})
    result = case Build::RESULT[build.result]
    when :ok
      'green'
    when :fail
      'red'
    else
      'grey'
    end

    image_tag "/result/#{result}.gif", options
  end
end
