module CamerasHelper

  def camera_author(camera)
    user_signed_in? && current_user.id == camera.user_id
  end
end
